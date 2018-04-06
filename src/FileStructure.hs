module FileStructure(
    FileStructure(..),
    toString
)where

data FileStructure  = Dir String [FileStructure]
                    | File String
                    deriving (Show)

toString' :: Int -> FileStructure -> String
toString' 0 (File s) = s ++ "\n"
toString' 0 (Dir s fs) = s ++ "\n" ++ (concatMap (toString' 1) fs)
toString' n (File s) = (concat (replicate (n - 1) "|   ")) ++ "|- " ++ s ++ "\n"
toString' n (Dir s fs) = (concat (replicate (n - 1) "|   ")) ++ "|- " ++ s ++ "\n" ++ (concatMap (toString' (n + 1)) fs)

toString :: FileStructure -> String
toString = toString' 0
