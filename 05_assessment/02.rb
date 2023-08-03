=begin

Question 2 
4 Points

What is a closure's binding and when is it formed? Which names does the block between lines 7-9 bind to?

=end

num = 4

def yield_to_block(arg)
  yield arg if block_given?
end

yield_to_block(num) do |value|
  puts value
end

arr = [20, 40, 60]
hsh = { a: 3, b: 2, c: 5 }

def map(qux)
  qux += 2
end

=begin

Your Answer

A closure's binding is a list of references to the artifacts within scope at the time of its creation. For the closure in lines 7-9 its binding includes num, the #map method and the #yield_to_block method, but not arr or hsh.

=end