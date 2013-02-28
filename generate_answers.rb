require 'dictionary.rb'

dictionary_arr = Dictionary::build_dictionary
File.delete(Dictionary::DICTIONARY_ANSWERS_FILE) if File.exists?(Dictionary::DICTIONARY_ANSWERS_FILE)
file = File.open(Dictionary::DICTIONARY_ANSWERS_FILE,"a")
	
File.open(Dictionary::DICTIONARY_QUESTIONS_FILE).each do |line|
	pattern = line.strip	
  dictionary_arr.each do |term|
		if term.match(pattern)
			file.write term
			file.write "\n"
			break #saves time, getting out the inner loop
		end
  end
end