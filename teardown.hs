#!/usr/bin/env stack
-- stack --install-ghc runghc --package turtle
{-# LANGUAGE OverloadedStrings #-}

module Main where

import Turtle
import Prelude hiding (FilePath)
import qualified Data.Text as T

config :: IO FilePath
config = (\h -> h </> "github" </> "dotfiles" </> "config.yaml") <$> home

links :: Text -> [FilePath]
links = fmap (fromText . T.tail . T.dropWhile (/= ' ')) . T.lines

unlink :: FilePath -> IO ()
unlink f = home >>= \h -> rm (h </> f)

main :: IO ()
main = do
  echo "Tearing down…"
  configFile <- config
  configText <- readTextFile configFile
  mapM_ unlink $ links configText
  echo "Done!"
