To use:
======

% ruby words.rb 

% ruby words.rb --help 

shows usage info. 

Defaults are 'words' file given, slice length of 4 and output file names 
as described in directions.

Assumptions/Commentary
======================

* I read "every sequence of fours letters" in instructions literally and noting
presence of input like "10th", I assumed the possibility of such (nonsense) 
words as "Hello3World". I therefore wrote String.explode_word to return an
array of letter sequences (of some minimal length) within given string.

* My HashBuild::slice_hash returns a hash with possibly > 1 entries under a 
given slice key. This was conscious decision: I thought such a animal may be
useful in its own right. I may want to know how many and which words contain
a given slice. 

* I understand the use of delete_if means I need to iterate over keys in hash 
twice to arrive at output. I could have (and originally did) simply exclude
slice keys with > 1 values when I wrote output files. I felt that was conflating responsibilities, ie key removal and output. And, again, I thought, now that I have this nice slice hash, I may want to do something else besides write it
to two different files. 

* HashBuilder::slice_hash takes an enumerable because I did not want to couple
it to IO. It is easier to test as written.

* Sixteen rspec tests live where you would expect them.

* As you may know, I did not write trollop stuff.
