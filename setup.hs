#!/usr/bin/env stack
-- stack --install-ghc runghc --package turtle
{-# LANGUAGE OverloadedStrings #-}

module Main where

import Control.Arrow  ((***), second)
import Turtle
import Prelude hiding (FilePath)
import qualified Data.Text as T

type FileLink = (FilePath, FilePath)

dotfiles :: IO FilePath
dotfiles = (</> "github/dotfiles") <$> home

config :: IO FilePath
config = (</> "config.yaml") <$> dotfiles

toFL :: Text -> FileLink
toFL = (fromText *** fromText) .
  second (T.dropWhile ((||) <$> (== ':') <*> (== ' '))) .
  T.break (== ':')

fileLinks :: Text -> [FileLink]
fileLinks = fmap toFL . T.lines

symlink :: FileLink -> IO ()
symlink (file, link) = do
  h <- home
  d <- dotfiles
  procs "ln" ["-s", f (d </> file), f (h </> link)] empty
  where f = either (error . T.unpack) id . toText

main :: IO ()
main = do
  echo "Setting up…"
  configFile <- config
  configText <- readTextFile configFile
  mapM_ symlink $ fileLinks configText
  echo "Done!"
