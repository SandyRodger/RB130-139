=begin
Question 7
3 Points

What does it mean when we say blocks have lenient arity? Show two examples of this behavior.

Your Answer

Blocks have lenient arity, this means that they can take fewer or more arguments than the parameters they are defined with. Extra arguments are ignored and extra parameters are assigned to nil. See example below:

=end

def takes_block(arg1, arg2, arg3, arg4)
  yield(arg1, arg2, arg3, arg4)
end

takes_block(1, 2, 3, 4) {|a, b, c, d| p [a, b, c, d]} # [1, 2, 3, 4]

def takes_block(arg1, arg2, arg3)
  yield(arg1, arg2, arg3)
end

takes_block(1, 2, 3) {|a, b, c, d| p [a, b, c, d]} # [1, 2, 3, nil]

def takes_block(arg1, arg2, arg3, arg4)
  yield(arg1, arg2, arg3, arg4, 5)
end

takes_block(1, 2, 3, 4) {|a, b, c, d| p [a, b, c, d]} # [1, 2, 3, 4]