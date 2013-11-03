#!/usr/bin/env ruby

HOME = ENV['HOME']
LINKS = '
    .emacs.d
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
    .zshrc
'.split

puts 'Tearing down...'
LINKS.each do |f|
  begin
    File.unlink File.join(HOME, f)
  rescue
    # ignore errors
  end
end
puts 'Done!'
