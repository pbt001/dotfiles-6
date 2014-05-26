#!/usr/bin/env ruby

HOME = ENV['HOME']
LINKS = '
    .astylerc
    .ghci
    .gitconfig
    .gvimrc
    .haskeline
    .hirc
    .inputrc
    .irbrc
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
