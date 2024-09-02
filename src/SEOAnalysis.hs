module SEOAnalysis (seoAnalysis) where

import HTMLElement

-- Function to analyze SEO practices
seoAnalysis :: [HTMLElement] -> String
seoAnalysis elements =
    let hasMeta = any (\(Header attrs) -> "meta" `elem` attrs) elements
        hasTitle = any (\(Nav attrs) -> "title" `elem` attrs) elements
        seoScore = (if hasMeta then 1 else 0) + (if hasTitle then 1 else 0)
    in if seoScore == 2
       then "The webpage follows basic SEO best practices."
       else "The webpage lacks some basic SEO elements. Consider adding meta tags and a title."
