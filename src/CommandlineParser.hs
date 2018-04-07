{-# LANGUAGE DataKinds #-}
module CommandlineParser (mainParser) where

import Options.Declarative
import Control.Monad.IO.Class
import FileStructure

-- fileStructure targetDir -to targetFileName
mainParser  :: Arg "targetDir" FilePath
            -> Cmd "this program is to get file structure program" ()
mainParser fp = liftIO $ printFileStructure $ get fp
