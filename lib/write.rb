require './lib/code.rb'
handle = File.open(ARGV[0], "r")
incoming_text = handle.read

handle.close
etb = EnglishToBraille.new
etb.english_returns_braille_array(incoming_text)
#puts incoming_text
require 'pry'; binding.pry

=begin
need to input incoming_text into my code file as the parameter
'words'
=end
