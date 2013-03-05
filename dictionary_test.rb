#Name: Usha
#need to have rails, mocha and shoulda gems installed
#'ruby dictionary_test.rb' in command line from the project directory will run the test
require './dictionary'
require 'test/unit'
require 'shoulda'
require 'mocha'
class DictionaryTest < Test::Unit::TestCase
  context "create dictionary" do
    should "process words and create qa files" do
      word = "word1"
      Dictionary.stubs(:read_word_from_file).yields(word)
      Dictionary.expects(:process_word).with(word, {})
      Dictionary.expects(:create_qa_files).with({})
      Dictionary.create
    end
  end 

  context "process word" do
    should "add the 4 char sequence to the dictionary" do
      dictionary_hash = {}
      expected_hash = {"carr"=>"carrot", "arro"=>"carrot", "rrot"=>"carrot"}
      Dictionary.process_word("carrot", dictionary_hash)

      assert_equal expected_hash, dictionary_hash
    end

    should "not add the words that are less than 4 chars" do
      dictionary_hash = {}
      expected_hash = {}
      Dictionary.process_word("ca", dictionary_hash)

      assert_equal expected_hash, dictionary_hash
    end

    should "not remove the entry from hash if there is a duplication" do
      dictionary_hash = {"arro" => "arrow"}
      expected_hash = {"carr"=>"carrot", "rrot"=>"carrot"}
      Dictionary.process_word("carrot", dictionary_hash)

      assert_equal expected_hash, dictionary_hash
    end
  end
end
