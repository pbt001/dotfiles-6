#!/usr/bin/env ruby

require 'yaml'

HOME = ENV['HOME']
LINKS = YAML::load_file 'config.yaml'

puts 'Tearing down...'
LINKS.each do |_, link|
  begin
    File.unlink File.join(HOME, link)
  rescue
    # ignore errors
  end
end
puts 'Done!'
