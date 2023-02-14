## [Lesson 1: Blocks](https://launchschool.com/lessons/c0400a9c/assignments)

- [Closures](#closures)
- [Calling methods with blocks](#calling-methods-with-blocks)
- [Writing methods that take blocks](#writing-methods-that-take-blocks)
- [Yielding](#yielding)
- [Yiedling with an argument](#yiedling-with-an-argument)
- [Arity](#arity)
- [Return value of yielding to a block](#return-value-of-yielding-to-a-block)
- [When to use blocks in your own methods](#when–to–use-blocks-in-your-own-methods)


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


```ruby
3.times do |num|
  puts num
end
```

- `3` is the calling object
- `times` is the method being called
- `do...end` is the block
- `num` between the pipes is the block parameter
- `num` within the block is the block local variable, with scope constrained to the block.

*It is important that the block local variable does not shadow variables outside the block, which would make variables outside the block inaccessible.*

```ruby
# method implementation
def increment(number)
  if block_given?
    yield(number + 1)
  end
  number + 1
end

# method invocation
increment(5) do |num|
  puts num
end
```

### [Arity](https://launchschool.com/lessons/c0400a9c/assignments/5a060a20)

Arity is the rules of how many arguments you must pass to a block/proc/lambda.

```ruby
def test1
  yield(1, 2)
end

test1 { |num| puts num } # => 1

def test2
  yield(1)
end

test2 do |num1, num2|
  puts "#{num1} #{num2}"  # => 1 (with an extra space)
end
```

The lesson here is that blocks will ignore extra arguments. In `#test1` the extra block argument is ignored and in `test2` the block local variable is assigned to `nil`. This is called **lenient arity** and applies to blocks and procs, but not lambdas, which have **strict arity**. Strict here means you have to pass in the number of arguments that the lambda expects. The topic of arity goes super deep, so know that this is just a superficial look. Most importantly, if the method/block allows for optional arguments, the arity rules do not apply to those arguments.

### [Return value of yielding to a block](https://launchschool.com/lessons/c0400a9c/assignments/5a060a20)
```ruby
def compare(str)
  puts "Before: #{str}".   
  after = yield(str)
  puts "After: #{after}". 
end

compare('hello') { |word| word.upcase } 

# Before: hello
# After: HELLO
# => nil

compare('hello') { |word| word.slice(1..2) }

# Before: hello
# After: el
# => nil

compare('hello') { |word| "nothing to do with anything" }

# Before: hello
# After: nothing to do with anything
# => nil

compare('hello') { |word| puts "hi" }

# Before: hello
# hi
# After:
# => nil
```

###[When to use blocks in your own methods](https://launchschool.com/lessons/c0400a9c/assignments/5a060a20)

1. Defer implementation code to method caller.
2. Sandwich code.
