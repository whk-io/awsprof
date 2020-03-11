#! /usr/bin/env ruby

require "inifile"
require "tty-prompt"

home = File.expand_path("~")
file = "#{home}/.aws/credentials"

profiles = []

myini = IniFile.load(file)
myini.each_section do |section|
  profiles << section
end

puts "Current Profile: " + ENV["AWS_PROFILE"].to_s

prompt = TTY::Prompt.new
input = prompt.enum_select("Choose your AWS Profile?", profiles)

open("/tmp/aws-profile", "w") { |f|
  f.puts input
}
