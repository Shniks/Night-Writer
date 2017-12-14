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
    dictionary = Dictionary.new

    assert_instance_of Dictionary, dictionary
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

  def test_insert_braille_array_text_into_hash_one_key
    nr = NightRead.new
    result = nr.insert_braille_array_text_into_hash(["aaa", "bbb", "ccc", "ddd"])


    assert_equal ["aaa", "bbb", "ccc"], nr.english_wrap[1]
  end

  def test_insert_braille_array_text_into_hash_two_key
    nr = NightRead.new
    result = nr.insert_braille_array_text_into_hash(["aaa", "bbb", "ccc", "ddd", "eee", "fff"])


    assert_equal [["aaa", "bbb", "ccc"],["ddd", "eee", "fff"]], nr.english_wrap.values
  end

  def test_length_of_braille_hash
    nr = NightRead.new
    result = nr.insert_braille_array_text_into_hash(["aaa", "bbb", "ccc", "ddd", "eee", "fff"])

    assert_equal 2, result.count
  end

end
