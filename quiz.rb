#!/usr/bin/env ruby

class RubyQuiz

  def initialize(filename, seq_ct)
    @filename = filename
    @seq_ct = seq_ct
  end

  def multiple_exist?(seq)
    File.open(@filename, "r") do |f|
      matches = 0
      f.each do |line|
        if line.include?(seq)
          matches += 1
        end
      end
      if matches > 1
        return true
      end
      f.close
    end
    return false
  end


  def write_file(*args)
    f = File.open(*args)
      yield f
    if block_given?
      f.close
    end
  end

  def recurse
    File.open(@filename, "r") do |f|
      f.each do |line|
        line = line.strip
        has_multiple = false
        seq = nil
        chars = line.length - 1
        if chars >= 4
          (0...chars).each do |i|
            seq = line[i,@seq_ct]
            if seq.length >= 4
              if self.multiple_exist?(seq)
                has_multiple = true
                break
              end
          if not has_multiple and not seq.nil?
            self.write_file('questions', "a") do |f|
                  seq.each { |s| f.write(s + "\n") }
                end

           self.write_file('answers', "a") do |f|
                  line.each {  |l| f.write(l + "\n") }
                end
          end
          end
          end
        end
      end
    end
  end
end
r = RubyQuiz.new("words", 4)
r.recurse
