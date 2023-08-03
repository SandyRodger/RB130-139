=begin

Question 10 2 Points Saved
What is the mechanism used on line 2 called? Rewrite the code in such a way that doesn't use this mechanism.

=end

arr = ["33", "44", "55"]
arr.map!(&:to_i)

p arr # => [33, 44, 55]

=begin

In line 2 the unary & operator is used to convert the symbol to a proc object. This is don bey calling the Symbol#to_proc method on #to_i Another way of writing this would be:

=end

arr.map {|elem| elem.to_i}

