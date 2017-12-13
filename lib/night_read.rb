require 'pry'
require "./lib/dictionary"

class NightRead


  attr_reader    :dictionary
  attr_accessor  :english_wrap
                 :count

  def initialize

    @dictionary = Dictionary.new.dictionary.invert
    @english_wrap = Hash.new
    @count = 0

  end

  def convert_braille_text_into_array(incoming_text)
    english_wrap_input = incoming_text.split("\n")
  end

  def insert_braille_array_text_into_english_wrap_hash(english_wrap_input)
    length = english_wrap_input.length
    until @count == length / 3
      @count += 1
      english_wrap[@count] = english_wrap_input.slice!(0..2)
    end
    english_wrap
  end











end
