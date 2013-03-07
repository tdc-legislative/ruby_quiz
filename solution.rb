# Jason Rao

def process(word, words)
  length = word.length
  if length >= 4
    $j = 0
    $k = 4
    $l = 4
    while $l < length  do
     if words[word[$j, $k]].nil?
        words[word[$j, $k]] = word
     else
        a = [word[$j, $k]]
        words.delete(a[0])
     end
       $j = $j + 1
       $l = $l + 1
    end
  end
   words
end

hash = Hash.new()
words = Hash.new()

IO.foreach("words") do |line|
  words = process(line.strip!, hash)
end

File.exist?('questions') ? File.delete('questions') : nil
File.exist?('answers') ? File.delete('answers') : nil

questions_file = File.open('questions', 'w')
answers_file = File.open('answers', 'w')

questions_file.write("# Jason Rao\n")
answers_file.write("# Jason Rao\n")

words.each do |key, value|
  questions_file.write("#{key}\n")
  answers_file.write("#{value}\n")
end

questions_file.close()
answers_file.close()