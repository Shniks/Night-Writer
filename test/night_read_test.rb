require './lib/night_read'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'


class NightReadTest < Minitest::Test

  def test_if_it_exist
    nr = NightRead.new

    assert_instance_of NightRead, nr
  end

  def test_if_it_brings_in_dictionary
    dic = Dictionary.new

    assert_instance_of Dictionary, dic
  end

  def test_if_hash_created
    nr = NightRead.new

    assert_equal nr.english_wrap, Hash.new
  end

  def test_convert_braille_text_into_array
    nr = NightRead.new
    result = nr.convert_braille_text_into_array("0..0..\n...0..")

    assert_equal ["0..0..", "...0.."], result
  end

  def test_insert_braille_array_text_into_english_wrap_hash_one_key
    nr = NightRead.new
    result = nr.insert_braille_array_text_into_english_wrap_hash(["aaa", "bbb", "ccc", "ddd"])


    assert_equal ["aaa", "bbb", "ccc"], english_wrap[1]
  end



  # def test_one_letter
  #   etb = NightWrite.new
  #   result = etb.english_returns_braille_array("h")
  #
  #   assert_equal ["0.00.."], result
  # end
  #
  # def test_one_symbol
  #   etb = NightWrite.new
  #   result = etb.english_returns_braille_array("?")
  #
  #   assert_equal ["..0.00"], result
  #   refute_equal [".....0", "..0.00"], result
  # end
  #
  # def test_one_word
  #   etb = NightWrite.new
  #   result = etb.english_returns_braille_array("hell")
  #
  #   assert_equal ["0.00..", "0..0..", "0.0.0.", "0.0.0."], result
  # end
  #
  # def test_two_words_with_space
  #   etb = NightWrite.new
  #   result = etb.english_returns_braille_array("hello world")
  #
  #   assert_equal ["0.00..", "0..0..", "0.0.0.", "0.0.0.", "0..00.", "......", ".000.0", "0..00.", "0.000.", "0.0.0.", "00.0.."], result
  #   refute_equal ["0.00..", "0..0..", "0.0.0.", "0.0.0."], result
  # end
  #
  # def test_one_upcase_letter
  #   etb = NightWrite.new
  #   result = etb.english_returns_braille_array("H")
  #
  #   assert_equal [".....0", "0.00.."], result
  #   # refute_equal ["0.00..", "0..0..", "0.0.0.", "0.0.0."], etb.english_returns_braille_array('hello world')
  # end
  #
  # def test_two_upcase_letters
  #   etb = NightWrite.new
  #   result = etb.english_returns_braille_array("HeL")
  #
  #   assert_equal [".....0", "0.00..", "0..0..", ".....0", "0.0.0."], result
  #   # refute_equal ["0.00..", "0..0..", "0.0.0.", "0.0.0."], etb.english_returns_braille_array('hello world')
  # end
  #
  # def test_two_upcase_letters_with_one_space
  #   etb = NightWrite.new
  #   result = etb.english_returns_braille_array("H eL")
  #
  #   assert_equal [".....0", "0.00..", "......", "0..0..", ".....0", "0.0.0."], result
  #   # refute_equal ["0.00..", "0..0..", "0.0.0.", "0.0.0."], etb.english_returns_braille_array('hello world')
  # end
  #
  # # def test_wrap_every_eighty_strings
  # #   etb = NightWrite.new
  # #   etb.wrap_every_80_strings()
  # # end
  # #
  #
  # def test_converts_braille_hash_to_braille_one_letter_only
  #   etb = NightWrite.new
  #   etb.converts_braille_hash_to_braille({1 => ["0.00.."]})
  #
  #   assert_equal "0.\n" "00\n" "..\n", etb.converts_braille_hash_to_braille({1 => ["0.00.."]})
  # end
  #
  # def test_converts_braille_hash_to_braille_two_letters
  #   etb = NightWrite.new
  #   etb.converts_braille_hash_to_braille({1 => ["0.00..", "0..0.."]})
  #
  #   assert_equal "0.0.\n" "00.0\n" "....\n", etb.converts_braille_hash_to_braille({1 => ["0.00..", "0..0.."]})
  # end
  #
  # def test_converts_braille_hash_to_braille_four_letters
  #   etb = NightWrite.new
  #   etb.converts_braille_hash_to_braille({1 => ["0.00..", "0..0..", "0.0.0.", "00..00"]})
  #
  #   assert_equal "0.0.0.00\n" "00.00...\n" "....0.00\n", etb.converts_braille_hash_to_braille({1 => ["0.00..", "0..0..", "0.0.0.", "00..00"]})
  # end
  #
  # def test_converts_braille_hash_to_braille_two_keys_three_letters_each
  #   etb = NightWrite.new
  #   etb.converts_braille_hash_to_braille({1 => ["0.00..", "0..0..", "0.0.0.", "00..00"], 2 => ["0.00..", "0..0..", "0.0.0.", "00..00"]})
  #
  #   assert_equal "0.0.0.00\n" "00.00...\n" "....0.00\n" "0.0.0.00\n" "00.00...\n" "....0.00\n", etb.converts_braille_hash_to_braille({1 => ["0.00..", "0..0..", "0.0.0.", "00..00"], 2 => ["0.00..", "0..0..", "0.0.0.", "00..00"]})
  # end
  #
  # def test_converts_braille_hash_to_braille_four_keys_two_letters_each
  #   etb = NightWrite.new
  #   etb.converts_braille_hash_to_braille({1 => ["0.00..", "0..0.."], 2 => ["0.00..", "0..0.."], 3 => ["0.00..", "0..0.."], 4 => ["0.00..", "0..0.."]})
  #
  #   assert_equal "0.0.\n" "00.0\n" "....\n" "0.0.\n" "00.0\n" "....\n" "0.0.\n" "00.0\n" "....\n" "0.0.\n" "00.0\n" "....\n", etb.converts_braille_hash_to_braille({1 => ["0.00..", "0..0.."], 2 => ["0.00..", "0..0.."], 3 => ["0.00..", "0..0.."], 4 => ["0.00..", "0..0.."]})
  # end
  # # def test_output_braille_in_three_rows
  # #   etb = NightWrite.new
  # #
  # #   result = etb.output_braille_in_three_rows(["0.0.0.00", "00.00...", "....0.00"])
  # #
  # #   assert_nil nil, result
  # # end
  #

end
