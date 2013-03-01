# by: Sebastian Sierra
#
# Instructions to execute: (tested in ruby 1.9.3)
# ruby scrapper.rb 'filename'
#
# where 'filename' is the name of the file to be processed (dictionary)
#
# Assumptions (made based on the example and the 'words' file provided):
#  => the sequences are considered case sensitive (Call != call)
#  => the sequences of letters are alphanumeric (call, 12ca as23 are all valid)

if ARGV.size != 1
  puts "ERROR: wrong number of arguments"
  puts "Usage: ruby scrapper.rb 'filename'"
  puts "(where filename is the dictionary's file)"
  exit
end

# stores the sequences letter sequences
sequences = {}

# handle opening file errors
begin
  # reads entire file
  text = File.open(ARGV[0]).read()
  questions = File.open('questions','w')
  answers = File.open('answers','w')
rescue
  puts "ERROR: there was an error trying to open/creating files"
  puts "Check permissions"
  exit
end

# split lines to process each word
lines = text.split(/\n/)

puts "Processing file, please wait "

# process each line of the file
lines.each do |line|

  # take every 4 letter sequence that appears and stores it
  for i in 0..line.chomp.size-4 do
    if sequences[line[i,4]].nil?
      sequences[line[i,4]] = [line.chomp]
    else
      sequences[line[i,4]] << line.chomp
    end
  end
end

# Write content in questions and answers files
sequences.each do |key, values|
  unless values.size > 1
    questions << "#{key}\n"
    answers << "#{values.first}\n"
  end
end


# close files
questions.close
answers.close

puts "Done."
