=begin

Question 1 
4 Points 

Describe the two main use-cases of blocks and provide code snippets to demonstrate each of these.

Your Answer

Sandwich code: Methods that take blocks can perform an operation before and after running the block. For example logging data or measuring how long a task takes. This could look like this:

=end

def some_task
  start = Time.now
  yield
  finish = Time.now
  puts "This task took #{finish - start} seconds"
end

some_task {sleep 2} # => This task took 2.00107 seconds

=begin

Defer implementation: When the developer writing a method is not sure exactly how the method will be implemented they can defer the decision to the person implementing the method. This allows for greater flexibility for the method and many Ruby methods are designed with this in mind. The min_by method is a good example of this. The writer allows the implementer to decide what minimum means in context.

=end

p ["horse", "owl", "duck"].min_by {|word| word.length} # => "owl"
p ["horse", "owl", "duck"].min_by {|word| word[0]} # => "duck"

=begin

In the first #min_by method the implementer wanted to find the shortest word, but in the second they wanted to compare the elements by their first letter.

=end