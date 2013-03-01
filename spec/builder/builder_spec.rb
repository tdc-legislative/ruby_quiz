require 'spec_helper'
require 'hash_builder'
include HashBuilder

describe "Hash Builder" do
	it "['arrows'] should produce 3 slice keys" do
		map = slice_hash(["arrows"], 4)
		map.keys.size.should == 3
		map['arro'].length == 1
		map['arro'] == ['arrows']
		map['rrow'].length == 1
		map['rrow'] == ['arrows']
		map['rows'].length == 1
		map['rows'] == ['arrows']
	end

	it "['arrows', 'borrows'] should produce 5 slice keys, with duplicates" do
		map = slice_hash(["arrows", "borrows"], 4)
		map.keys.size.should == 5
		map['arro'].length == 1
		map['arro'] == ['arrows']
		map['borr'].length == 1
		map['borr'] == ['borrows']
		map['orro'].length == 1
		map['orro'] == ['borrows']
		map['rrow'].length == 2
		map['rrow'] == ['arrows', 'borrows']
		map['rows'].length == 2
		map['rows'] == ['arrows', 'borrows']
	end

	it "['abcde', 'vwxyz'] should produce 4 distinct slice keys" do
		map = slice_hash(['abcde', 'vwxyz'])
		map.keys.size == 4
		map['abcd'].length == 1
		map['abcd'] = ['abcde']
		map['bcde'].length == 1
		map['bcde'] = ['abcde']
		map['vwxy'].length == 1
		map['vwxy'] = ['vwxyz']
		map['wxyz'].length == 1
		map['wxyz'] = ['vwxyz']
	end

	it "['abcde', 'vwxyz'] should produce 6 distinct slice keys with specified slice size" do
		map = slice_hash(['abcde', 'vwxyz'], 3)
		map.keys.size == 6
		map['abc'].length == 1
		map['abc'] == ['abcde']
		map['bcd'].length == 1
		map['bcd'] = ['abcde']
		map['cde'].length == 1
		map['cde'] == ['abcde']
		map['vwx'].length == 1
		map['vwx'] = ['vwxyz']
		map['wxy'].length == 1
		map['wxy'] = ['vwxyz']
		map['xyz'].length == 1
		map['xyz'] = ['vwxyz']
	end

	it "should explode word & produce 2 slices under one word" do
		map = slice_hash(["abcd2efgh"])
		map.keys.size == 2
		map['abcd'].length == 1
		map['abcd'] = ['abcd2efgh']
		map['efgh'].length == 1
		map['abcd'] = ['abcd2efgh']
	end

	it 'should handle example provided by dolan' do
		map = slice_hash(['arrows', 'carrots', 'give', 'me']).delete_if { |k,v| v.length > 1 }
		map.keys.size == 6
		map['rrow'] = ['arrows']
		map['carr'] = ['carrots']
		map['give'] = ['give']
		map['rrot'] = ['carrots']
		map['rots'] = ['carrots']
		map['rows'] = ['arrows']
	end
end
