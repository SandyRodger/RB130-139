=begin

Question 6 
5 Points

Write a method that acts similarly to Hash#filter, with some key differences:

Instead of being called on the hash, pass the hash to the method as an argument
Use an explicit block to reference the block used to decide which elements should be selected.
If a block is not specified in the invocation, return an empty hash.
Do not mutate the original hash.

=end

# my code: 

def filter(hash, &block)
  return {} if !block_given?
  hash.each_with_object({}) do |(k, v), output|
    output[k] = v if yield (k, v)
  end
end

hash = { "Pens" => 2, "Erasers" => 5, "Markers" => 1, "Pencils" => 10 }

# Here are some test cases you can use:

p (filter(hash) { |key, value| key != "Erasers" })
# {"Pens"=>2, "Markers"=>1, "Pencils"=>10}

p (filter(hash) { |key, value| value >= 10 })
# {"Pencils"=>10}

p (filter(hash))
# {}

p hash
# {"Pens"=>2, "Erasers"=>5, "Markers"=>1, "Pencils"=>10}