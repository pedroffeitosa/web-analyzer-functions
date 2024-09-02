module HTMLElement where

data HTMLElement = Section [String] | Article [String] | Header [String] | Footer [String]
                 | Nav [String] | Main [String] | Div [String] deriving Show

parseTag :: String -> Maybe HTMLElement
parseTag tag
    | "<section" `isInfixOf` tag = Just $ Section (extractAttributes tag)
    | "<article" `isInfixOf` tag = Just $ Article (extractAttributes tag)
    | "<header"  `isInfixOf` tag = Just $ Header (extractAttributes tag)
    | "<footer"  `isInfixOf` tag = Just $ Footer (extractAttributes tag)
    | "<nav"     `isInfixOf` tag = Just $ Nav (extractAttributes tag)
    | "<main"    `isInfixOf` tag = Just $ Main (extractAttributes tag)
    | "<div"     `isInfixOf` tag = Just $ Div (extractAttributes tag)
    | otherwise = Nothing

extractAttributes :: String -> [String]
extractAttributes tag = words $ filter (`notElem` "<>") $ dropWhile (/= ' ') tag
