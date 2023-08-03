=begin

Question 8
3 Points

What does the unary & operator do when prepended to a method parameter? When is this useful? Provide some example code.

Your Answer

Unary & in a method parameter indicates that the method argument will be passed in as a block and converted to a proc object. This can be useful when you want to passed the proc object on to another method or assign it to a variable. Without the unary & the block can only be yielded to. In this example we pass the block as a proc object to another method:

=end
def test(arg, &block)
  var =  block.call(arg)
  next_method(block)
end
