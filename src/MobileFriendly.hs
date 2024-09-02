module MobileFriendly (mobileFriendlyAnalysis) where

import HTMLElement

-- Function to analyze mobile-friendliness
mobileFriendlyAnalysis :: [HTMLElement] -> String
mobileFriendlyAnalysis elements =
    let hasViewport = any (\(Div attrs) -> "viewport" `elem` attrs) elements
        isMobileFriendly = hasViewport
    in if isMobileFriendly
       then "The webpage is mobile-friendly."
       else "The webpage is not mobile-friendly. Consider adding a viewport meta tag."
