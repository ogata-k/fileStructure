{-# LANGUAGE DataKinds #-}
module CommandlineParser (mainParser) where

import Options.Declarative

-- fileStructure targetDir -to targetFileName
mainParser  :: Arg "targetDir" FilePath
            -> Flag "f" '["to"] "FileName" "target-file to write in targetFile.txt" (Def "result" String)
            -> Cmd "this program is to get file structure program" ()
mainParser fp target = liftIO $ printFileStructure $ get fp
