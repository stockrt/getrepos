#!/usr/bin/env ruby

require 'json'

def is_valid_json?(data)
  begin
    JSON.parse(data)
    true
  rescue
    false
  end
end

def is_valid_json_file?(filename)
  is_valid_json?(File.read(filename))
end

############
### MAIN ###
############

if __FILE__ == $0
  exit 0 if is_valid_json_file?(ARGV.first)
  exit 1
end
