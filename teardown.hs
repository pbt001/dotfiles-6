#!/usr/bin/env stack
-- stack --install-ghc runghc --package turtle
{-# LANGUAGE OverloadedStrings #-}

module Main where

import Turtle
import Prelude hiding (FilePath)
import qualified Data.Text as T

config :: FilePath
config = "config.yaml"

toLink :: Text -> FilePath
toLink = fromText . T.tail . T.dropWhile (/= ' ')

links :: Text -> [FilePath]
links = fmap toLink . T.lines

dotfiles :: IO FilePath
dotfiles = (\h -> h </> "github" </> "dotfiles") <$> home

unlink :: FilePath -> IO ()
unlink f = home >>= \h -> rm (h </> f)

main :: IO ()
main = do
  echo "Tearing down…"
  configText <- readTextFile config
  mapM_ unlink $ links configText
  echo "Done!"
