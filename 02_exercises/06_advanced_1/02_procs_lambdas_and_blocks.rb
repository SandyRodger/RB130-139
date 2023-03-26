# https://launchschool.com/exercises/753d0323

# Group 1: Procs

# my_proc = proc { |thing| puts "This is a #{thing}." } 
# puts my_proc # => #<Proc:0x00007f9d300bf458 02_procs_lambdas_and_blocks.rb:4>
# puts my_proc.class # => Proc
# my_proc.call # => This is a .
# my_proc.call('cat') # => This is a cat.

=begin

- I'm pretty sure #proc is a Kernel method. 
- Procs attach themselves to a block. In order for the block to be run the Proc#call method must be called on the proc. 
- Lenient-arity: If the block references a block-variable, but no argument is passed to #call, the variable will be assigned to nil (like an instance variable). This is what happens in line 7. 
- In line 8 we pass a string to the #call method and it is passed to the block.

# Group 2: Lambdas 

my_lambda = lambda { |thing| puts "This is a #{thing}." } 
my_second_lambda = -> (thing) { puts "This is a #{thing}." }
puts my_lambda # => #<Proc:0x00007fb691185d18 02_procs_lambdas_and_blocks.rb:11 (lambda)>
puts my_second_lambda # => #<Proc:0x00007f94df11dd18 02_procs_lambdas_and_blocks.rb:12 (lambda)>
puts my_lambda.class # => Proc
my_lambda.call('dog') # => This is a dog.
my_lambda.call # => Argument Error ( expecting 1, given 0)
my_third_lambda = Lambda.new { |thing| puts "This is a #{thing}." } # => NameError - uninitialized constant Lambda

=begin

- Lambdas are created like procs, with a block passed to the Kernel.lambda method. 
- Unlike a proc, #lambda will check how many arguments are passed to it. This is called 'strict-arity'
- Lines 13 to 16 show two different syntaxes for defining lambdas.
- Line 22 shows that, despite being created with the #lambda method, these objects are objects of the Proc class.
- line 24 demonstrates strict-arity. Lambdas will raise an exeption in the number of arguments passed to #call does not match the number of parameters defined in the block.
- Line 25 does not work because Lambda is not a class in Ruby.

=end

# # Group 3: Implicit blocks
# def block_method_1(animal)
#   yield
# end

# block_method_1('seal') { |seal| puts "This is a #{seal}."} # => This is a .
# block_method_1('seal') # => Local jump error

=begin

- Line 42 does not print out 'seal' because the 'animal' variable has not been passed to the yield method. This proves that blockas have lenient arity as, instead of raising an exeption, the block assigns the block variable to 'nil'
- Line 44 shows that when 'yield' is envoked a block must be provided. This does not pertain to arity.

=end

# # Group 4: yield

# def block_method_2(animal)
#   yield(animal)
# end
# 
# block_method_2('turtle') { |turtle| puts "This is a #{turtle}."} # => This is a turtle.
# block_method_2('turtle') do |turtle, seal|
#   puts "This is a #{turtle} and a #{seal}."
# end # => This is a turtle and a .
# block_method_2('turtle') { puts "This is a #{animal}."} # => Name Error: undefined local variable/method 'animal'

=begin

- Line 58 works fine, but the variable names are a little confusing. Better to not repeat variable names for different parts of the code.
- Lines 59 - 61 show that because the block has lenient arity, and the second animal is not passed to #yield, the block assigns 'seal' to 'nil'.
- line 62 demonstrates that blocks must have block variables defined between two pipes ('| |') in order to receive arguments yielded to it. 
=end

=begin

In conclusion:

Procs and blocks are identical except for these points:
  - Lambdas have strict arity. (Procs have lenient arity).
  - Lambdas are not a class, so cannot be greated with #new. (Procs can be). They can be thought of as a special kind of proc.

Implicit blocks have lenient arity, but any variable used in the block must wihtin the block's scope.

=end

# LS solution:

=begin

Group 1:

A new Proc object can be created with a call of proc instead of Proc.new
A Proc is an object of class Proc
A Proc object does not require that the correct number of arguments are passed to it. If nothing is passed, then nil is assigned to the block variable.
Group 2

A new Lambda object can be created with a call to lambda or ->. We cannot create a new Lambda object with Lambda.new
A Lambda is actually a different variety of Proc.
While a Lambda is a Proc, it maintains a separate identity from a plain Proc. This can be seen when displaying a Lambda: the string displayed contains an extra "(lambda)" that is not present for regular Procs.
A lambda enforces the number of arguments. If the expected number of arguments are not passed to it, then an error is thrown.
Group 3

A block passed to a method does not require the correct number of arguments. If a block variable is defined, and no value is passed to it, then nil will be assigned to that block variable.
If we have a yield and no block is passed, then an error is thrown.
Group 4

If we pass too few arguments to a block, then the remaining ones are assigned a nil value.
Blocks will throw an error if a variable is referenced that doesn't exist in the block's scope.
Comparison

Lambdas are types of Proc's. Technically they are both Proc objects. An implicit block is a grouping of code, a type of closure, it is not an Object.
Lambdas enforce the number of arguments passed to them. Implicit blocks and Procs do not enforce the number of arguments passed in.

  =end