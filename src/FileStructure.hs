module FileStructure(
       printFileStructure
)where

import System.Directory
import System.FilePath.Windows ((</>), takeFileName)
import Control.Applicative ((<$>))
import Control.Monad (join)

data FileStructure  = Dir String [FileStructure]
                    | File String
                    deriving (Show)

toString' :: Int -> FileStructure -> String
toString' _ (File "") = ""
toString' _ (Dir "" _) = ""
toString' 0 (File s) = s ++ "\n"
toString' 0 (Dir s fs) = s ++ "\n" ++ (concatMap (toString' 1) fs)
toString' n (File s) = (concat (replicate (n - 1) "|   ")) ++ "|- " ++ s ++ "\n"
toString' n (Dir s fs) = (concat (replicate (n - 1) "|   ")) ++ "|- " ++ s ++ "\n" ++ (concatMap (toString' (n + 1)) fs)

toString :: FileStructure -> String
toString = toString' 0

convert :: FilePath -> IO FileStructure
convert fp = do
    file <- doesFileExist fp
    direc <- doesDirectoryExist fp
    changeHead <$> convert' file direc fp
    where
        takeFileName' :: FileStructure -> FileStructure
        takeFileName' (File s) = File $ takeFileName s
        takeFileName' (Dir s fs) = Dir (takeFileName s) $ map takeFileName' fs

        convert' :: Bool -> Bool -> FilePath -> IO FileStructure
        convert' file direc fp
            | file = return (takeFileName' $ File fp)
            | direc = do
                        lst <- listDirectory fp
                        converted' <- mapM (convert . (</>) fp) lst
                        let converted = map takeFileName' converted'
                        return $ Dir fp converted
            | otherwise  = return (File "")

        changeHead :: FileStructure -> FileStructure
        changeHead (File "") = File ""
        changeHead (File s) = File fp 
        changeHead (Dir s fs) = Dir fp fs

printFileStructure :: FilePath -> IO ()
printFileStructure fp = join $ putStr <$> toString <$> (convert fp)
