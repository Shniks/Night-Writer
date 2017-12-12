require 'pry'
class EnglishToBraille

    # words = "hello world"

    attr_reader :dictionary, :count

    def initialize

      @count = count
      @dictionary = {
                     "a" => "0.....",
                     "b" => "0.0...",
                     "c" => "00....",
                     "d" => "00.0..",
                     "e" => "0..0..",
                     "f" => "000...",
                     "g" => "0000..",
                     "h" => "0.00..",
                     "i" => ".00...",
                     "j" => ".000..",
                     "k" => "0...0.",
                     "l" => "0.0.0.",
                     "m" => "00..0.",
                     "n" => "00.00.",
                     "o" => "0..00.",
                     "p" => "000.0.",
                     "q" => "00000.",
                     "r" => "0.000.",
                     "s" => ".00.0.",
                     "t" => ".0000.",
                     "u" => "0...00",
                     "v" => "0.0.00",
                     "w" => ".000.0",
                     "x" => "00..00",
                     "y" => "00.000",
                     "z" => "0..000",
                     " " => "......",
                     "." => "..00.0",
                     "," => "..0...",
                     "!" => "..000.",
                     "?" => "..0.00",
                     "'" => "....0.",
                     "-" => "....00",
                     "cap" => ".....0"
                   }

    end


    def english_returns_braille_array(words)
      braille_array = []
      words_split_to_letters = words.split('')
      words_split_to_letters.each do |letter|
        if letter.upcase == letter && letter != " "
          braille_array << dictionary["cap"]
          braille_array << dictionary[letter.downcase]
        else
          braille_array << dictionary[letter]
        end
      end
      braille_array
    end

    def wrap_every_80_strings(braille_array)
      # Need to create tests fo this method
      wrap_length = braille_array.length
      slices_array = braille_array
      slices_hash = Hash.new
      count = 0
      until wrap_length <= 80 do
        count += 1
        slices_hash[count] = slices_array.slice!(0..79)
        wrap_length -= 80
      end
      count += 1
      slices_hash[count] = slices_array
    end

    def converts_slices_hash_to_braille(slices_hash)
      result = []
      first_row =[]
      second_row = []
      third_row = []
      i = 0
      Until i = slices_hash.length
      i = i + 1
      # slices_hash[i].each do |key|
        slices_hash[i].each_with_index do |data, index|
          first_row << slices_hash[i][index][0..1]
          second_row << slices_hash[i][index][2..3]
          third_row << slices_hash[i][index][4..5]
        end
        result << first_row.join
        result << second_row.join
        result << third_row.join
      end
    end


    def output_braille_in_three_rows(data)
      puts data.join("\n")
    end



     translator = EnglishToBraille.new

end
