#!/usr/bin/env stack
-- stack --install-ghc runghc --package turtle
{-# LANGUAGE OverloadedStrings #-}

module Main where

import Control.Arrow
import Turtle
import Prelude hiding (FilePath)
import Data.FileEmbed (embedStringFile)
import qualified Data.Text as T

type FileLink = (FilePath, FilePath)

config :: FilePath
config = "config.yaml"

toFL :: Text -> FileLink
toFL = (fromText *** fromText) .
  second (T.dropWhile ((||) <$> (== ':') <*> (== ' '))) .
  T.break (== ':')

fileLinks :: Text -> [FileLink]
fileLinks = fmap toFL . T.lines

dotfiles :: IO FilePath
dotfiles = (\h -> h </> "github" </> "dotfiles") <$> home

symlink :: FileLink -> IO ()
symlink (file, link) = let f = either (error . T.unpack) id . toText in
  do
    h <- home
    d <- dotfiles
    procs "ln" ["-s", f (d </> file), f (h </> link)] empty

main :: IO ()
main = do
  echo "Setting up…"
  configText <- readTextFile config
  mapM_ symlink $ fileLinks configText
  echo "Done!"
