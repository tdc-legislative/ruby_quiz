#Name: Usha
#Execute 'ruby executor.rb' from command line. Words will be read from 'words' file
require "./util.rb"
require "./file_handler.rb"
class Dictionary
  SUB_SIZE = 4
  class << self
    def create
      #creates the hash by processing each word from the file
      dictionary_hash = {}
      FileHandler.read_word_from_file('words') do |word|
        process_word(word, dictionary_hash)
      end
      FileHandler.create_qa_files(dictionary_hash)
    end

    def process_word(word, dictionary_hash) 
      #substrings method is defined in util.rb by reopening the string class
      word.substrings(Dictionary::SUB_SIZE).each do |s|
        if dictionary_hash.has_key?(s)
          dictionary_hash.delete(s) 
        else
          dictionary_hash[s] = word
        end
      end
    end
  end
end
