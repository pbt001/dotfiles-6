#!/usr/bin/env ruby

HOME = ENV['HOME']
DOTFILES = File.join(HOME, 'github', 'dotfiles')
LINKS = {
  'astylerc'     => '.astylerc',
  'ghci'         => '.ghci',
  'gitconfig'    => '.gitconfig',
  'gvimrc'       => '.gvimrc',
  'haskeline'    => '.haskeline',
  'hirc'         => '.hirc'
  'inputrc'      => '.inputrc',
  'irbrc'        => '.irbrc',
  'tmux_conf'    => '.tmux.conf',
  'vim'          => '.vim',
  'vimrc'        => '.vimrc',
  'zshrc'        => '.zshrc'
}

puts 'Setting up...'
LINKS.each do |file, link|
  File.symlink(File.join(DOTFILES, file), File.join(HOME, link))
end
puts 'Done!'
