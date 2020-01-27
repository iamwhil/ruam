# In order to run ruby code it must be tokenized, parsed, and then compiled
# Before the YARV can run the code.
# This explores the tokinization by tapping into the Ripper tool.

require 'ripper'
require 'pp'
code = <<STR
10.times do |n|
  puts n
end
STR
puts code
pp Ripper.lex(code)