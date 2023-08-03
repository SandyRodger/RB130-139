=begin

Question 11 
2 Points

Why does line 5 raise an error, but not line 7? Describe what lines 5 and 7 demonstrate about Ruby methods.

=end

def output(arg)
  puts arg
end

output "This", "That"

output("Hello world!") { loop }

=begin

Your Answer

Line 5 raises an error because we are passing 2 arguments to a method defined with 1 parameter. Methods have strict arity so this will cause an Argument Error to be raised. Line 7 does not raise an exception because we pass one argument, "Hello world" and the block is an implicit block. All ruby methods can take a block without explicitly having one as a parameter.

=end