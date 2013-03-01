require 'spec_helper'
require 'string_ext'

module StringExtensions
  describe "explode_word" do


    it 'explode_word should report []' do
         "123".explode_word.should == []
    end


    it 'explode_word should report []' do
         "abc".explode_word.should == []
    end

    it 'explode_word should report ["abcd", "efgh"]' do
         "abcd32efgh".explode_word.should == ["abcd", "efgh"]

    end

    it 'should report []' do
         "abcd32efgh".explode_word(6).should == []
    end



    it "should report ['abcdcd', 'efghed']" do
      "ab32abcdcd32efghed".explode_word(6).should == ['abcdcd', 'efghed'] 
    end

   
    it "should throw NoMethodError" do
      	expect {
          	nil.explode_word(6).should == ['abcdcd', 'efghed']
          }.to raise_error(NoMethodError)
    end
   


    it "should report ['abcdcd', 'efghed', 'zxcvbnb']" do
      "ab32abcdcd32efghed3zxcvbnb".explode_word(4).should == ['abcdcd', 'efghed', 'zxcvbnb']
    end
  end

  describe 'each_slice' do
    before(:each) do
      @result = []
    end

  	it 'should produce 2 slices of len 4' do
  		"12345".each_slice {|s| @result << s }
  		@result.should == ['1234', '2345']
  	end


  	it 'should produce 3 slices of len 3' do
  		"12345".each_slice(3) {|s| 	@result << s }
  		@result.should == ['123', '234', '345']

  	end


    it 'should produce 1 slice of len 5' do
  		"12345".each_slice(5) {|s| @result << s }
  		@result.should == ['12345']
    end


    it 'should produce 0 slices ' do
  	  "".each_slice(5) {|s| @result << s }
  		 @result.should == []
    end
  end

end

