=begin

Question 9 
3 Points

Identify the three major components of the code shown below. In addition to identifying the three major components, describe the role that |key, value| performs in the code.

Be sure to show the actual code associated with each of the components.

=end

hash.any? { |key, value| key == value }

=begin

Your Answer

hash is the calling object. #any? is the method invocation. { |key, value| key == value } is the block passed to the method as an argument. |key, value| are the block arguments that are assigned to each key and value of the hash during iteration. The block compares whether key and value have the same value using the #== method. This does not mean they are the same object, only that they have the same value. So the key value pair "dog" => "dog" would return true

=end