module HTMLReport (generateHTMLReport) where

import HTMLElement
import Scoring

-- Function to generate an HTML report
generateHTMLReport :: [HTMLElement] -> Int -> String
generateHTMLReport elements totalScore = unlines [
    "<html>",
    "<head><title>Web Structure Analysis Report</title></head>",
    "<body>",
    "<h1>Web Structure Analysis Report</h1>",
    "<h2>Elements Identified</h2>",
    "<ul>",
    concatMap formatElement elements,
    "</ul>",
    "<h2>Total Score: " ++ show totalScore ++ "</h2>",
    "</body>",
    "</html>"
  ]
  where
    formatElement element = "<li>" ++ show element ++ "</li>"
