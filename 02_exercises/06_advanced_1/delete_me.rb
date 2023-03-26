test = proc {}
p test.class.ancestors # => [Proc, Object, Kernel, BasicObject]
l_test = lambda {}
p l_test.class.ancestors # => [Proc, Object, Kernel, BasicObject]
