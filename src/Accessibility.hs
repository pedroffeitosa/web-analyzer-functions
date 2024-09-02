module Accessibility (accessibilityScore) where

import HTMLElement

-- Function to score based on accessibility features
accessibilityScore :: [HTMLElement] -> Int
accessibilityScore elements = sum $ map scoreElement elements
  where
    scoreElement (Div attrs) = if any ("role=" `isInfixOf`) attrs then 5 else 0
    scoreElement (Section attrs) = if any ("aria-" `isInfixOf`) attrs then 10 else 0
    scoreElement (Main attrs) = if any ("role=" `isInfixOf`) attrs then 5 else 0
    scoreElement _ = 0
