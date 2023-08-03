=begin

Question 5 
3 Points 

How do blocks compare to methods? Describe three differences.


Blocks and methods are both 'chunks of code', but some key differences are:

Naming: blocks do not have to be named, methods do.

Scoping: Blocks have different scoping rules, they have access to objects outside the block even when not passed in. Methods cannot see objects outside of themselves unless they are passed in as arguments.

Arity: Blocks have lenient arity, methods have strict arity. This means blocks can take more or fewer arguments than the parameters it is defined with, but methods cannot.

=end