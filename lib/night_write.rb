require 'pry'
require "./lib/dictionary"

class NightWrite

  attr_reader :dictionary, :count

  def initialize

    @count = 0
    @dictionary = Dictionary.new.dictionary

  end

  def english_returns_braille_array(incoming_text)
    braille = []
    incoming_text_split_to_letters = incoming_text.split('')
    incoming_text_split_to_letters.each do |letter|
      if letter.upcase == letter && letter != " "
        braille << dictionary["cap"]
        braille << dictionary[letter.downcase]
      else
        braille << dictionary[letter]
      end
    end
    braille
  end

  def wrap_every_eighty_strings(braille)
    wrap_length = braille.length
    braille_wrap = Hash.new
    until wrap_length <= 80 do
      count += 1
      braille_wrap[count] = braille.slice!(0..79)
      wrap_length -= 80
    end
    count += 1
    braille_wrap[count] = braille
  end

  def converts_braille_hash_to_braille(braille_wrap)
    result = []
    i = 0
    until i == braille_wrap.length do
      first_row =[]
      second_row = []
      third_row = []
      i = i + 1
      braille_wrap[i].each_with_index do |data, index|
        first_row << braille_wrap[i][index][0..1]
        second_row << braille_wrap[i][index][2..3]
        third_row << braille_wrap[i][index][4..5]
      end
      result << first_row.join + "\n"
      result << second_row.join + "\n"
      result << third_row.join + "\n"
    end
    result.join
  end


  # def output_braille_in_three_rows(data)
  #   puts data.join("\n")
  # end


# translator = EnglishToBraille.new


end
