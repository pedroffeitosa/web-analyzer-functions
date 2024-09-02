module ContentToCode (contentToCodeAnalysis) where

import HTMLElement

-- Function to analyze content-to-code ratio
contentToCodeAnalysis :: [HTMLElement] -> String
contentToCodeAnalysis elements =
    let contentLength = sum $ map (\(Main attrs) -> length attrs) elements
        totalLength = sum $ map (\(Div attrs) -> length attrs) elements
        ratio = if totalLength == 0 then 0 else (contentLength * 100) `div` totalLength
    in "Content-to-Code Ratio: " ++ show ratio ++ "%." ++
       if ratio > 50
       then " The ratio is good."
       else " The ratio is low; consider increasing content."
