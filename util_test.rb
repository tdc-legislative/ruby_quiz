#Name: Usha
#need to have rails, mocha and shoulda gems installed
#'ruby util_test.rb' in command line from the project directory will run the test
require './util'
require 'test/unit'
require 'shoulda'
class UtilTest < Test::Unit::TestCase
  context "substrings" do
    should "return all substrings of the given size" do
      word = "carrots"
      expected = ["carr", "arro", "rrot", "rots"]
      assert_equal expected, word.substrings(4)
    end

    should "be empty when the given word is less than the substring size" do
      word = "car"
      assert_equal [], word.substrings(4)
    end

    should "be empty when called on an empty string" do
      word = ""
      assert_equal [], word.substrings(4)
    end
  end
end
