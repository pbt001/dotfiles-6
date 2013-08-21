#!/usr/bin/env ruby

HOME = ENV['HOME']
LINKS = '
    .ghci
    .gitconfig
    .gvimrc
    .haskeline
    .inputrc
    .irbrc
    .ocamlinit
    .perlcriticrc
    .perltidyrc
    .tmux.conf
    .vim
    .vimrc
    .zsh.local
'.split

puts 'Tearing down...'
LINKS.each {|f| File.unlink File.join(HOME, f) }
puts 'Done!'
