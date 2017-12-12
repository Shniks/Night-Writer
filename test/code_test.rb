require './lib/code'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'


class EnglishToBrailleTest< Minitest::Test

  def test_if_it_exist
    etb = EnglishToBraille.new

    assert_instance_of EnglishToBraille, etb
  end

  def test_one_letter
    etb = EnglishToBraille.new
    etb.english_returns_braille_array("h")

    assert_equal ["0.00.."], etb.english_returns_braille_array('h')
  end

  def test_one_letter_again
    etb = EnglishToBraille.new
    etb.english_returns_braille_array("w")
    etb.english_returns_braille_array("e")

    assert_equal [".000.0"], etb.english_returns_braille_array('w')
    assert_equal ["0..0.."], etb.english_returns_braille_array('e')
    refute_equal ["000.0"], etb.english_returns_braille_array('w')

  end

  def test_one_word
    etb = EnglishToBraille.new
    etb.english_returns_braille_array("hell")

    assert_equal ["0.00..", "0..0..", "0.0.0.", "0.0.0."], etb.english_returns_braille_array('hell')
  end

  def test_two_words_with_space
    etb = EnglishToBraille.new
    etb.english_returns_braille_array("hello world")

    assert_equal ["0.00..", "0..0..", "0.0.0.", "0.0.0.", "0..00.", "......", ".000.0", "0..00.", "0.000.", "0.0.0.", "00.0.."], etb.english_returns_braille_array('hello world')
    refute_equal ["0.00..", "0..0..", "0.0.0.", "0.0.0."], etb.english_returns_braille_array('hello world')
  end

  def test_one_upcase_letter
    etb = EnglishToBraille.new
    etb.english_returns_braille_array("H")

    assert_equal [".....0", "0.00.."], etb.english_returns_braille_array('H')
    # refute_equal ["0.00..", "0..0..", "0.0.0.", "0.0.0."], etb.english_returns_braille_array('hello world')
  end

  def test_two_upcase_letters
    etb = EnglishToBraille.new
    etb.english_returns_braille_array("HeL")

    assert_equal [".....0", "0.00..", "0..0..", ".....0", "0.0.0."], etb.english_returns_braille_array('HeL')
    # refute_equal ["0.00..", "0..0..", "0.0.0.", "0.0.0."], etb.english_returns_braille_array('hello world')
  end

  def test_two_upcase_letters_with_one_space
    etb = EnglishToBraille.new
    etb.english_returns_braille_array("H eL")

    assert_equal [".....0", "0.00..", "......", "0..0..", ".....0", "0.0.0."], etb.english_returns_braille_array('H eL')
    # refute_equal ["0.00..", "0..0..", "0.0.0.", "0.0.0."], etb.english_returns_braille_array('hello world')
  end

  # def test_wrap_every_40_strings
  #   etb = EnglishToBraille.new
  #   etb.wrap_every_40_strings()
  # end
  #

  def test_converts_slices_hash_to_braille_one_letter_only
    etb = EnglishToBraille.new
    etb.converts_slices_hash_to_braille(["0.00.."])

    assert_equal ["0.", "00", ".."], etb.converts_slices_hash_to_braille(["0.00.."])
  end

  def test_converts_slices_hash_to_braille_two_letters
    etb = EnglishToBraille.new
    etb.converts_slices_hash_to_braille(["0.00..", "0..0.."])

    assert_equal ["0.0.", "00.0", "...."], etb.converts_slices_hash_to_braille(["0.00..", "0..0.."])
  end

  def test_converts_slices_hash_to_braille_four_letters
    etb = EnglishToBraille.new
    etb.converts_slices_hash_to_braille(["0.00..", "0..0..", "0.0.0.", "00..00"])

    assert_equal ["0.0.0.00", "00.00...", "....0.00"], etb.converts_slices_hash_to_braille(["0.00..", "0..0..", "0.0.0.", "00..00"])
  end

  def test_output_braille_in_three_rows
    etb = EnglishToBraille.new

    result = etb.output_braille_in_three_rows(["0.0.0.00", "00.00...", "....0.00"])

    assert_nil nil, result
  end


end
