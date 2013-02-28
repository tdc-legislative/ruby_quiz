#lengthy algorithm is used to compensate for insufficient of knowledge in regular expression
require 'dictionary.rb'

class Word
	
	def initialize(word)
		@word = word.strip
	end
	
	def extract_questions
		questions_arr = Array.new
		v =  "[aeiouy]"		#vowels
		c =  "[^aeiouy]"	#consonants	 
		pattern_vccv = [v,c,c,v].join('') #vowel, consonant, consonant, vowel pattern
		pattern_cvvc = [c,v,v,c].join('') #consonant, vowel, vowel, consonant pattern
		pattern_cvcc = [c,v,c,c].join('')	#consonant, vowel, consonant, consonant pattern	
		pattern_ccvc = [c,c,v,c].join('') #other patterns
		pattern_cvcv = [c,v,c,v].join('')
		pattern_vcvc = [v,c,v,c].join('')
		pattern_vvcc = [v,v,c,c].join('')
		pattern_ccvv = [c,c,v,v].join('')	
		patterns_arr = [pattern_vccv,pattern_cvvc,pattern_cvcc,pattern_ccvc,pattern_cvcv,pattern_vcvc,pattern_vvcc,pattern_ccvv]
		patterns_arr.each do |pattern|
			if !@word.scan(/#{pattern}/i).empty?
				questions_arr <<  @word.scan(/#{pattern}/i)
			end	
		end
		questions_arr		
	end
end

dictionary_arr = Array.new #storing all questions

File.open(Dictionary::DICTIONARY_FILE).each do |line|
	word = Word.new(line)
	if word.to_s.length >= 4
			word.extract_questions.each do |question|
			dictionary_arr << "#{question}"			
		end	
	end	
end

dictionary = Dictionary.new(dictionary_arr)