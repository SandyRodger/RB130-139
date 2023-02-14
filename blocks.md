## [Lesson 1: Blocks](https://launchschool.com/lessons/c0400a9c/assignments)

- [Closures](#closures)
- [Calling methods with blocks](#calling-methods-with-blocks)
- [Writing methods that take blocks](#writing-methods-that-take-blocks)
- [Yielding](#yielding)


### [Closures](https://launchschool.com/lessons/c0400a9c/assignments/0a7a9177)

  A savable "chunk of code". It binds the artifacts around it (like copying and pasting a cell in microsoft Excel) and builds an "enclosure" around them. Whatever methods, variabes etc. are within scope at the moment of saving remains in scope when the closure is called at a later time. It is comparable to a method you've defined, which can be passed around. These references to its surrounding objects is called its **binding**. 

In Ruby a closure is handled with a Proc, Block or Lambda. Proc is a [class](https://docs.ruby-lang.org/en/2.6.0/Proc.html) which can instantiate proc objects, the other two are not.

### [Calling methods with blocks](https://launchschool.com/lessons/c0400a9c/assignments/ff802368)

Let's take apart this block:

```ruby
[1, 2, 3].each do |num|
  puts num
end
```

We have:

`[1, 2, 3]` : the collection or Array object.

`#each` : the method which we call on the object.

`do ... end` : this is the block. *It is an argument to the method call*.


Breaking down code into these 3 parts is important. Often it is more complicated than the example above.

How do the method and the block interact?

```ruby
# Example 1: passing in a block to the `Integer#times` method.

3.times do |num|
  puts num
end
=> 3

# Example 2: passing in a block to the `Array#map` method.

[1, 2, 3].map do |num|
  num + 1
end
=> [2, 3, 4]

# Example 3: passing in a block to the `Hash#select` method.

{ a: 1, b: 2, c: 3, d: 4, e: 5 }.select do |_, value|
  value > 2
end
=> { c: 3, d: 4, e: 5 }
```

In these three examples the blocks return their calling object or a new object according to the block. Sometimes the block;s code affects the return value and sometimes not - and that is what we need to focus on now.

The code in the block is not the method implementation. It is passed into the method and the method decides what to do with it. Often looking at the documentation and experimenting is the best way to understand how a particular method treats a block.

### [Writing methods that take blocks](https://launchschool.com/lessons/c0400a9c/assignments/5a060a20)

Every Ruby method already takes a block.

```ruby
def hello
  "hello!"
end

hello { puts 'hi' }                      # => "hi"
```
This shows that in Ruby every method can take an optional block as an implicit argument.

### [Yielding](https://launchschool.com/lessons/c0400a9c/assignments/5a060a20)

```ruby
def echo_with_yield(str)
  yield
  str
end

echo_with_yield("hello!") { puts "world" }          # world
                                                    # => "hello!"
```
So remember :
1. The number of arguments needs to match the method definition (obviously)
2. The `yield` keyword executes the block.

Yielding without a block will cause a `LocalJumpError`. `Kernel#block_given?` is a good way to guard against this.

```ruby
def echo_with_yield(str)
  yield if block_given?
  str
end
```

Passing execution to a block can make the code jump around somewhat.

```ruby
# method implementation
def say(words)
  yield if block_given?
  puts "> " + words
end

# method invocation
say("hi there") do
  system 'clear'
end  # clears screen first, then outputs "> hi there"
```
Note that in line 3 execution jumps to somewhere else, just like a method. This is why it is helpful to think of blocks as behaving like methods.

### [Yiedling with an argument](https://launchschool.com/lessons/c0400a9c/assignments/5a060a20)


