require './lib/write'
require './lib/dictionary'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'


class FileReaderTest < Minitest::Test

  def test_if_it_exist
    fr = FileReader.new
    assert_instance_of FileReader, fr
  end



end


class NightWriterTest < Minitest::Test

  def test_if_it_exist
    nr = NightWriter.new
    assert_instance_of NightWriter, nr
  end



end
