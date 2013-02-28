TDC Ruby On Rails quiz                                                                                                                       
======================                                                                                                                       
                                                                                                                               
Quiz instructions                                                                                                             
------------------                                                                                                             
There are many ways to solve this. The point of this exercise is to show us your coding style and thought process. Please take as much time as you need.
Given a list of words (`./words`), generate two output files, 'questions' and 'answers'.  'questions' should contain every sequence of four letters that appears in exactly one word of the dictionary, one sequence per line.  'answers' should contain the words that contain the sequences, in the same order, again one per line.

Example                                                                                                                    
-------                                                                                                                    
Say this is your dictionary:                                                                                                   
* arrows                                                                                                                       
* carrots                                                                                                                      
* give                                                                                                                         
* me                                                                                                                           
                                                                                                                               
'questions' would contain:                                                                                                     
* carr                                                                                                                         
* give                                                                                                                         
* rots                                                                                                                         
* rows                                                                                                                         
* rrot                                                                                                                         
* rrow                                                                                                                         
                                                                                                                               
and 'answers' would have:                                                                                                      
* carrots                                                                                                                      
* give                                                                                                                         
* carrots                                                                                                                      
* arrows                                                                                                                       
* carrots                                                                                                                      
* arrows                                                                                                                       
                                                                                                                               
'arro' wouldn't show up in 'questions', because it appears in two words                                                        

Submission
----------
Please make sure to run your code and check your results before submission.  After you feel confident about the results your code is producing, fork the project and send a pull request. In your submission include your name in a comment near the top of each file along with instructions on how to run your code.  I hope that's clear enough.  Let me know if you have any questions.  If you have any other code samples you'd be willing to share, I'd really appreciate it.                                                                                                      
