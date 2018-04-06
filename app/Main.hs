module Main where

import Options.Declarative(run_)
import CommandlineParser

main :: IO ()
main = run_ mainParser
