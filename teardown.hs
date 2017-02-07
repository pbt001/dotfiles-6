#!/usr/bin/env stack
-- stack --install-ghc runghc --package file-embed --package turtle
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell #-}

module Main where

import Turtle
import Prelude hiding (FilePath)
import Data.FileEmbed (embedStringFile)
import qualified Data.Text as T

config :: Text
config = $(embedStringFile "config.yaml")

toLink :: Text -> FilePath
toLink = fromText . T.tail . T.dropWhile (/= ' ')

links :: [FilePath]
links = fmap toLink . T.lines $ config

dotfiles :: IO FilePath
dotfiles = (\h -> h </> "github" </> "dotfiles") <$> home

unlink :: FilePath -> IO ()
unlink f = home >>= \h -> rm (h </> f)

main :: IO ()
main = do
  echo "Tearing down…"
  mapM_ unlink links
  echo "Done!"
