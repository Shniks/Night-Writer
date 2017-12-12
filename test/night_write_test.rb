require './lib/night_write'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'


class NightWriteTest < Minitest::Test

  def test_if_it_exist
    etb = NightWrite.new

    assert_instance_of NightWrite, etb
  end

  def test_one_letter
    etb = NightWrite.new
    etb.english_returns_braille_array("h")

    assert_equal ["0.00.."], etb.english_returns_braille_array('h')
  end

  def test_one_letter_again
    etb = NightWrite.new
    etb.english_returns_braille_array("w")
    etb.english_returns_braille_array("e")

    assert_equal [".000.0"], etb.english_returns_braille_array('w')
    assert_equal ["0..0.."], etb.english_returns_braille_array('e')
    refute_equal ["000.0"], etb.english_returns_braille_array('w')

  end

  def test_one_word
    etb = NightWrite.new
    etb.english_returns_braille_array("hell")

    assert_equal ["0.00..", "0..0..", "0.0.0.", "0.0.0."], etb.english_returns_braille_array('hell')
  end

  def test_two_words_with_space
    etb = NightWrite.new
    etb.english_returns_braille_array("hello world")

    assert_equal ["0.00..", "0..0..", "0.0.0.", "0.0.0.", "0..00.", "......", ".000.0", "0..00.", "0.000.", "0.0.0.", "00.0.."], etb.english_returns_braille_array('hello world')
    refute_equal ["0.00..", "0..0..", "0.0.0.", "0.0.0."], etb.english_returns_braille_array('hello world')
  end

  def test_one_upcase_letter
    etb = NightWrite.new
    etb.english_returns_braille_array("H")

    assert_equal [".....0", "0.00.."], etb.english_returns_braille_array('H')
    # refute_equal ["0.00..", "0..0..", "0.0.0.", "0.0.0."], etb.english_returns_braille_array('hello world')
  end

  def test_two_upcase_letters
    etb = NightWrite.new
    etb.english_returns_braille_array("HeL")

    assert_equal [".....0", "0.00..", "0..0..", ".....0", "0.0.0."], etb.english_returns_braille_array('HeL')
    # refute_equal ["0.00..", "0..0..", "0.0.0.", "0.0.0."], etb.english_returns_braille_array('hello world')
  end

  def test_two_upcase_letters_with_one_space
    etb = NightWrite.new
    etb.english_returns_braille_array("H eL")

    assert_equal [".....0", "0.00..", "......", "0..0..", ".....0", "0.0.0."], etb.english_returns_braille_array('H eL')
    # refute_equal ["0.00..", "0..0..", "0.0.0.", "0.0.0."], etb.english_returns_braille_array('hello world')
  end

  # def test_wrap_every_eighty_strings
  #   etb = NightWrite.new
  #   etb.wrap_every_80_strings()
  # end
  #

  def test_converts_braille_hash_to_braille_one_letter_only
    etb = NightWrite.new
    etb.converts_braille_hash_to_braille({1 => ["0.00.."]})

    assert_equal "0.\n" "00\n" "..\n", etb.converts_braille_hash_to_braille({1 => ["0.00.."]})
  end

  def test_converts_braille_hash_to_braille_two_letters
    etb = NightWrite.new
    etb.converts_braille_hash_to_braille({1 => ["0.00..", "0..0.."]})

    assert_equal "0.0.\n" "00.0\n" "....\n", etb.converts_braille_hash_to_braille({1 => ["0.00..", "0..0.."]})
  end

  def test_converts_braille_hash_to_braille_four_letters
    etb = NightWrite.new
    etb.converts_braille_hash_to_braille({1 => ["0.00..", "0..0..", "0.0.0.", "00..00"]})

    assert_equal "0.0.0.00\n" "00.00...\n" "....0.00\n", etb.converts_braille_hash_to_braille({1 => ["0.00..", "0..0..", "0.0.0.", "00..00"]})
  end

  def test_converts_braille_hash_to_braille_two_keys_three_letters_each
    etb = NightWrite.new
    etb.converts_braille_hash_to_braille({1 => ["0.00..", "0..0..", "0.0.0.", "00..00"], 2 => ["0.00..", "0..0..", "0.0.0.", "00..00"]})

    assert_equal "0.0.0.00\n" "00.00...\n" "....0.00\n" "0.0.0.00\n" "00.00...\n" "....0.00\n", etb.converts_braille_hash_to_braille({1 => ["0.00..", "0..0..", "0.0.0.", "00..00"], 2 => ["0.00..", "0..0..", "0.0.0.", "00..00"]})
  end

  def test_converts_braille_hash_to_braille_four_keys_two_letters_each
    etb = NightWrite.new
    etb.converts_braille_hash_to_braille({1 => ["0.00..", "0..0.."], 2 => ["0.00..", "0..0.."], 3 => ["0.00..", "0..0.."], 4 => ["0.00..", "0..0.."]})

    assert_equal "0.0.\n" "00.0\n" "....\n" "0.0.\n" "00.0\n" "....\n" "0.0.\n" "00.0\n" "....\n" "0.0.\n" "00.0\n" "....\n", etb.converts_braille_hash_to_braille({1 => ["0.00..", "0..0.."], 2 => ["0.00..", "0..0.."], 3 => ["0.00..", "0..0.."], 4 => ["0.00..", "0..0.."]})
  end
  # def test_output_braille_in_three_rows
  #   etb = NightWrite.new
  #
  #   result = etb.output_braille_in_three_rows(["0.0.0.00", "00.00...", "....0.00"])
  #
  #   assert_nil nil, result
  # end


end
