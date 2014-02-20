#!/usr/bin/env ruby

HOME = ENV['HOME']
DOTFILES = File.join(HOME, 'github', 'dotfiles')
LINKS = {
  'astylerc'     => '.astylerc',
  'emacs'        => '.emacs',
  'emacs_d'      => '.emacs.d',
  'ghci'         => '.ghci',
  'gitconfig'    => '.gitconfig',
  'gvimrc'       => '.gvimrc',
  'haskeline'    => '.haskeline',
  'inputrc'      => '.inputrc',
  'irbrc'        => '.irbrc',
  'perlcriticrc' => '.perlcriticrc',
  'perltidyrc'   => '.perltidyrc',
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
