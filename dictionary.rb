class Dictionary
	
	DICTIONARY_FILE = 'words'
	DICTIONARY_QUESTIONS_FILE = 'questions'
	DICTIONARY_ANSWERS_FILE = 'answers'
	
	def initialize(dictionary_arr)
		counts = Hash.new(0)
		dictionary_arr.each {|v| counts[v] += 1} #count frequency of question
		dictionary_arr = counts.select { |v,count| count == 1} #select question which occurs only once
		dictionary_arr = Hash[*dictionary_arr.flatten].keys #extract only key of the hash, question
		write_questions_to_file(dictionary_arr)
	end
	
	def write_questions_to_file(dictionary_arr)
		begin
			#if there is already questions file, delete it
			if File.exists?(DICTIONARY_QUESTIONS_FILE)
				File.delete(DICTIONARY_QUESTIONS_FILE)
			end
			file = File.open(DICTIONARY_QUESTIONS_FILE,"a")
			dictionary_arr.each do |question|
				file.write question
				file.write "\n"
			end			
		rescue IOError => e
			print_r(e)
		ensure
			file.close unless file == nil
		end
	end
	
	def self.build_dictionary
		dictionary_arr = Array.new
		File.open(DICTIONARY_FILE).each do |line|
			dictionary_arr << line.strip
		end
		dictionary_arr
	end
end