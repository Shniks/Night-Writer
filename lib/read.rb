require './lib/night_read'
require 'pry'


handle = File.open(ARGV[0], "r")
incoming_text = handle.read
handle.close

binding.pry

# etb = NightWrite.new
# etb.english_returns_braille_array(incoming_text)
# etb.wrap_every_eighty_strings(etb.braille)
# etb.converts_braille_hash_to_braille(etb.braille_wrap)
#
# writer = File.open(ARGV[1], "w")
# writer.write(etb.result.join)
# writer.close
