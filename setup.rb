#!/usr/bin/env ruby

require 'yaml'

HOME = ENV['HOME']
DOTFILES = File.join(HOME, 'github', 'dotfiles')
LINKS = YAML::load_file 'config.yaml'

puts 'Setting up...'
LINKS.each do |file, link|
  File.symlink(File.join(DOTFILES, file), File.join(HOME, link))
end
puts 'Done!'
