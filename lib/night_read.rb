require 'pry'
require "./lib/dictionary"

class NightRead

  attr_reader    :dictionary

  attr_accessor  :english_wrap,
                 :count,
                 :braille_array,
                 :english_array,
                 :english_wrap_input,
                 :english_output_array,
                 :length

  def initialize

    @dictionary = Dictionary.new.dictionary.invert
    @english_wrap = Hash.new
    @braille_array = []
    @english_array = []
    @english_wrap_input = english_wrap_input
    @english_output_array = []
    @count = 0
    @i = 0
    @length = 0

  end

  def convert_braille_text_into_array(incoming_text)
    english_wrap_input = incoming_text.split("\n")
  end

  def insert_braille_array_text_into_hash(english_wrap_input)
    length = english_wrap_input.length
    until @count == length / 3
      @count += 1
      english_wrap[@count] = english_wrap_input.slice!(0..2)
    end
    english_wrap
  end

  def for_each_key_convert_braille_array_into_braille_characters(english_wrap)
    until @i == @count
      @i += 1
      until english_wrap[@i][0].length == 0
        top = english_wrap[@i][0]
        middle = english_wrap[@i][1]
        bottom = english_wrap[@i][2]
        braille_char_array = top.slice!(0..1) + middle.slice!(0..1) + bottom.slice!(0..1)
        braille_array << braille_char_array
      end
    end
  end

  def convert_braille_array_to_english_array
    braille_array.each do |letter|
      if letter == ".....0"
        @i = 1
      elsif @i == 1
        english_array << dictionary[letter].upcase
        @i = 0
      else
        english_array << dictionary[letter]
      end
    end
  end

  def wrap_english_letters_eighty_characters
    num = 0
    english_array.each do |letter|
      if num != 80
        english_output_array << letter
        num += 1
      else
        english_output_array << letter + ("\n")
        num = 0
      end
    end
  end

end
