require 'test/unit'
class QaTest
  context "read_word" do
    setup do
      f = File.open("word_test", 'w')
      f.write("word1\nword2\nword3\n")
    end
  end
end
