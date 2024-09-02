module Scoring (scoreStructure, ScoreCriterion(..), defaultCriteria) where

import HTMLElement

data ScoreCriterion = ScoreCriterion {
    criterionName :: String,
    criterionFunction :: HTMLElement -> Int
}

-- New scoring criteria for SEO, Mobile-Friendliness, and Content-to-Code ratio
seoScore :: HTMLElement -> Int
seoScore (Header attrs) = if "meta" `elem` attrs then 5 else 0
seoScore (Nav attrs) = if "title" `elem` attrs then 5 else 0
seoScore _ = 0

mobileFriendlyScore :: HTMLElement -> Int
mobileFriendlyScore (Div attrs) = if "viewport" `elem` attrs then 10 else 0
mobileFriendlyScore _ = 0

contentToCodeScore :: HTMLElement -> Int
contentToCodeScore (Main attrs) = if length attrs > 100 then 10 else 5
contentToCodeScore _ = 0

-- Default criteria, now including new criteria
defaultCriteria :: [ScoreCriterion]
defaultCriteria = [
    ScoreCriterion "Header Score" headerScore,
    ScoreCriterion "Nav Score" navScore,
    ScoreCriterion "Footer Score" footerScore,
    ScoreCriterion "SEO Score" seoScore,
    ScoreCriterion "Mobile-Friendliness Score" mobileFriendlyScore,
    ScoreCriterion "Content-to-Code Ratio Score" contentToCodeScore
  ]

-- Existing example scoring functions
headerScore :: HTMLElement -> Int
headerScore (Header _) = 10
headerScore _ = 0

navScore :: HTMLElement -> Int
navScore (Nav _) = 8
navScore _ = 0

footerScore :: HTMLElement -> Int
footerScore (Footer _) = 7
footerScore _ = 0

-- Function to calculate the total score based on criteria
scoreStructure :: [HTMLElement] -> [ScoreCriterion] -> Int
scoreStructure elements criteria = sum $ map (\c -> sum $ map (criterionFunction c) elements) criteria
