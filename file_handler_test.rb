#Name: Usha
#need to have rails, mocha and shoulda gems installed
#'ruby file_handler_test.rb' in command line from the project directory will run the test
require './file_handler'
require 'test/unit'
require 'shoulda'
require 'mocha'
class FileHandlerTest < Test::Unit::TestCase
  context "read word from file" do
    setup do
      @file_name = "word_test"
      @word_file = File.open(@file_name, "w")
      @word_file.write("word1\n")
      @word_file.flush
    end

    should "read the word from the file" do
      FileHandler.read_word_from_file(@file_name) do |word|
        assert_equal "word1", word
      end
    end

    teardown do
      @word_file.close
      File.delete(@file_name)
    end
  end

  context "create question and answer files" do
    should "create question and answer files" do
      dictionary_hash = {"carr" => "carrots", "arro" => "carrots"}
      FileHandler.create_qa_files(dictionary_hash)
      assert File.exists?("question.txt")
      assert File.exists?("answer.txt")

      question_content = File.open("question.txt").readlines
      assert_equal ["carr\n", "arro"], question_content

      answer_content = File.open("answer.txt").readlines
      assert_equal ["carrots\n", "carrots"], answer_content
    end

    teardown do
      File.delete('question.txt') if File.exists?('question.txt')
      File.delete('answer.txt') if File.exists?('answer.txt')
    end
  end
end
