class String
   # Greedily explode a string into an array of alpha sequences
   # of at least length n. Default n is 4.
   def explode_word(n=4)
   	return [] if self.length < n
      self.scan(Regexp.new("[a-zA-Z]{#{n-1}}[a-zA-Z]+"))
   end

   #
   # Yield each slice of length n from string
   # Default n = 4 because that is what current
   # problem calls for.
   #
   def each_slice(n = 4)
   	  raise LocalJumpError.new("No block given") if not block_given?
   	  length.times.each { |i|
   	  	  break if length-i < n
   	     yield self.slice(i,n)
   	  }
   end
 end
