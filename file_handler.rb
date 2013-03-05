#Name: Usha
#Execute 'ruby executor.rb' from command line. Words will be read from 'words' file
class FileHandler
  class << self
    def read_word_from_file(file_name)
      #opens the file to read words
      File.open(file_name, 'r').each do |word|
        yield word.chomp
      end
    end

    def create_qa_files(dictionary_hash)
      qa_file_handles do |question, answer|
        question.write(dictionary_hash.keys.join("\n"))
        answer.write(dictionary_hash.values.join("\n"))
      end
    end

    def qa_file_handles
      question = File.open('question.txt', 'w')
      answer = File.open('answer.txt', 'w')
      yield question, answer 
      question.close
      answer.close
    end
  end
end
