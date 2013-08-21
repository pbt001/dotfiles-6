#!/usr/bin/env ruby

HOME = ENV['HOME']
DOTFILES = File.join(HOME, 'github', 'dotfiles')
LINKS = {
  'ghci'         => '.ghci',
  'gitconfig'    => '.gitconfig',
  'gvimrc'       => '.gvimrc',
  'haskeline'    => '.haskeline',
  'inputrc'      => '.inputrc',
  'irbrc'        => '.irbrc',
  'ocamlinit'    => '.ocamlinit',
  'perlcriticrc' => '.perlcriticrc',
  'perltidyrc'   => '.perltidyrc',
  'tmux_conf'    => '.tmux.conf',
  'vim'          => '.vim',
  'vimrc'        => '.vimrc',
  'zsh_local'    => '.zsh.local'
}

puts 'Setting up...'
LINKS.each do |file, link|
  File.symlink(File.join(DOTFILES, file), File.join(HOME, link))
end
puts 'Done!'
