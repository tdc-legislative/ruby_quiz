#Name: Usha
#Execute 'ruby executor.rb' from command line. Words will be read from 'words' file
String.class_eval do
  def substrings(sub_size)
    seeker = 0
    substring_array = []
    while (seeker+4 <= size)
      substring_array << self.slice(seeker, sub_size)
      seeker += 1
    end
    substring_array
  end
end
