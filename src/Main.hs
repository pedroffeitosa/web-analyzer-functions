{-# LANGUAGE OverloadedStrings #-}
module Main where

import Options.Applicative
import Network.HTTP.Conduit (simpleHttp)
import Text.HTML.DOM (parseLBS)
import Text.XML.Cursor (Cursor, fromDocument, element, child, content, attribute)
import qualified Data.Text as T
import Data.Maybe (mapMaybe)
import Data.List (intercalate)
import Control.Monad (when)
import System.IO (writeFile)

import HTMLElement
import Scoring
import Accessibility (accessibilityScore)
import MobileFriendly (mobileFriendlyAnalysis)
import SEOAnalysis (seoAnalysis)
import ContentToCode (contentToCodeAnalysis)
import HTMLReport (generateHTMLReport)

data Options = Options
  { url :: String
  , format :: String
  }

-- CLI options parser
parseOptions :: Parser Options
parseOptions = Options
  <$> strOption
      ( long "url"
     <> metavar "URL"
     <> help "URL to analyze" )
  <*> strOption
      ( long "format"
     <> metavar "FORMAT"
     <> help "Output format: json or html" )

-- Main function with all features integrated
main :: IO ()
main = do
    opts <- execParser optsParser
    cursor <- fetchHTML (url opts)
    let tags = extractTags cursor
    let elements = mapMaybe parseTag (map T.unpack tags)
    let structureScore = scoreStructure elements defaultCriteria
    let accessScore = accessibilityScore elements
    let totalScore = structureScore + accessScore
    let mobileFriendly = mobileFriendlyAnalysis elements
    let seoReport = seoAnalysis elements
    let contentRatio = contentToCodeAnalysis elements

    case format opts of
        "html" -> do
            let report = generateHTMLReport elements totalScore
            writeFile "report.html" report
            putStrLn "HTML report generated: report.html"
        "json" -> do
            -- JSON output code here
            putStrLn "JSON report generated."
        _ -> putStrLn "Invalid format. Use 'json' or 'html'."

    -- Print additional analysis reports
    putStrLn seoReport
    putStrLn mobileFriendly
    putStrLn contentRatio
  where
    optsParser = info (parseOptions <**> helper)
      ( fullDesc
     <> progDesc "Analyze the structure of a web page and generate a report"
     <> header "WebAnalyzer - A Haskell web structure analyzer" )
