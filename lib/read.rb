require './lib/night_read'
require 'pry'


handle = File.open(ARGV[0], "r")
incoming_text = handle.read
handle.close



bte = NightRead.new
bte.convert_braille_text_into_array(incoming_text)
bte.insert_braille_array_text_into_hash(bte.convert_braille_text_into_array(incoming_text))
bte.for_each_key_convert_braille_array_into_braille_characters(bte.english_wrap)
bte.convert_braille_array_to_english_array
bte.wrap_english_letters_eighty_characters

writer = File.open(ARGV[1], "w")
writer.write(bte.english_output_array.join)
writer.close
