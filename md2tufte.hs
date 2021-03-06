#!/usr/bin/env stack
-- stack --install-ghc runghc --package turtle
{-# LANGUAGE OverloadedStrings #-}

module Main where

import Turtle
import Prelude hiding (FilePath)

md2pdf :: FilePath -> FilePath
md2pdf = (<.> "pdf") . dropExtension

parser :: Parser FilePath
parser = argPath "input.md" "Markdown file to convert & typeset"

typeset :: FilePath -> FilePath -> Text
typeset = format $
  "pandoc -t latex+smart --pdf-engine=xelatex --data-dir=$HOME/.pandoc --template=tufte_template.tex --listings "
  % fp % " -o " % fp

main :: IO ExitCode
main = do
  input <- options "Convert markdown file to LaTeX & typeset" parser
  shell (typeset input $ md2pdf input) empty
