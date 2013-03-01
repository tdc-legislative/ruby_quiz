$LOAD_PATH.unshift("./lib")
require 'hash_builder'
require 'trollop'

include HashBuilder

opts = Trollop::options  do
   banner <<-EOS
     Usage 'ruby words.rb [-i <input_file>] [-len <slice-len>] 
              [-q <questions_file>] [-a <answer_file>]
     
     Generate list of slices from words and the corresponding word
     in which slice appears. Any slice contained in two words is omitted.

   EOS
       opt :input, "Input words file", :default => "words"
       opt :questions, "Questions output file", :default => "questions"
       opt :answers, "Answers output file", :default => "answers"
       opt :len, "Length of slices", :default => 4
   end


puts "Reading from #{opts[:i]}. Processing input words >= length #{opts[:len]}"

questions = slice_hash(File.open(opts[:input]).lines, opts[:len]).delete_if { |k,v| v.length > 1 }

#
# Do the output
#
question_file = File.open(opts[:questions], "w")
answer_file = File.open(opts[:answers], "w")

questions.keys.sort.each { |k|
 		question_file.puts k
 		answer_file.puts questions[k]
}
question_file.close
answer_file.close

