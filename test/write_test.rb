require './lib/write'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'


class WriteTest < Minitest::Test

  def test_if_it_exist
    wr = Write.new

    assert_instance_of Write, wr
  end


end
