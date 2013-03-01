require 'string_ext'

module HashBuilder

   # 
   # Build a hash from an Enumerable of words considering only words of a min length.
   #
   # Keys in resulting hash are all slices of input words of length min.
   # Values in resulting hash are array of input words containing key slice.
   # An input word appears under each key that appears in the input word as a slice.
   #
   def slice_hash(words, min = 4)
      # mininal requirement for considering input word
      # We will skip any word does not have at least an alpha sequnce
      # of length min
   	match_min = Regexp.new("[a-zA-Z]{#{min}}")
   	questions = {} 
   	words.each { |w|
      	begin
            w.explode_word(min).each do |partial| 
               partial.each_slice(min)  { |seq|
                  questions[seq].nil? ? questions[seq] = [w] : questions[seq] << w     			
               }
            end	
      	end unless (w =~ match_min).nil? # skip invalid input words
    	}
    	questions
   end
end
