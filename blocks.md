## [Lesson 1: Blocks](https://launchschool.com/lessons/c0400a9c/assignments)

- [Closures](#closures)
- [Calling methods with blocks](#calling-methods-with-blocks)
- [Writing methods that take blocks](#writing-methods-that-take-blocks)
- [Yielding](#yielding)
- [Yiedling with an argument](#yiedling-with-an-argument)
- [Arity](#arity)
- [Return value of yielding to a block](#return-value-of-yielding-to-a-block)
- [When to use blocks in your own methods](#when-to-use-blocks-in-your-own-methods)
- [Flags](#flags)
- [Methods with an explicit block parameter](#methods-with-an-explicit-block-parameter)
- [Using Closures](#using-closures)
- [Summary](#summary)

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

### [When to use blocks in your own methods](https://launchschool.com/lessons/c0400a9c/assignments/5a060a20)

1. Defer implementation code to method caller.
2. Sandwich code.

1. There is a **method writer** and a **method caller** and they could be the same person. If the method writer wants to leave some decisions to the method caller they can do so with a block.
```ruby
def compare(str)
  puts "Before: #{str}"
	yield(str)
  puts "After: #{str}"
end

compare("hello"){|str|str.upcase!}

# Before: hello
# After: HELLO
# => nil
```
### [Flags](https://launchschool.com/lessons/c0400a9c/assignments/5a060a20)

Without a block one would need to use a flag. A flag is an argument passed to a method to direct what will happen in the method:

```ruby

def compare(str, flag)
  after = case flag
          when :upcase
            str.upcase
          when :capitalize
            str.capitalize
          # etc, we could have a lot of 'when' clauses
          end

  puts "Before: #{str}"
  puts "After: #{after}"
end

compare("hello", :upcase)

# Before: hello
# After: HELLO
# => nil
```
But a block is superior because it allows the user to ***refine*** the method, without altering it for other users. Many of Ruby's built-in methods are built in this way, ie. `Array#select`. If you are tweaking a method a little bit in many different places, you may be better off yielding to a block.

2. Sandwich code

This is code that performs a before and after, like the `#compare` method above. But before and after what? You can leave that up to the method caller. Timing, logging and notification systems are all good examples:
```ruby
def time_it
  time_before = Time.now
  yield                       # execute the implicit block
  time_after= Time.now

  puts "It took #{time_after - time_before} seconds."
end

time_it { sleep(3) }              # It took 3.003767 seconds.
                                  # => nil

time_it { "hello world" }         # It took 3.0e-06 seconds.
                                  # => nil
```
Another very important use for sandwich code is resource management. Many OS systems require the developer to first allocate a portion of a resource and after to clean up and free that resource. Omitting this process can lead to system crashes, memory leaks and file system corruption.

For instance:

```ruby
my_file = File.open("some_file.txt", "w+")          # creates a file called "some_file.txt" with write/read permissions
# write to this file using my_file.write
my_file.close
```
### [Methods with an explicit block parameter](https://launchschool.com/lessons/c0400a9c/assignments/5a060a20)

```ruby

def test(&block)
  puts "What's &block? #{block}"
end

test{|n| n * 2} # => What's &block? #<Proc:0x00007fc2388db8f8@delete_me.rb:5>

```
These are when you want to manage your block like any other object. Reassign it, pass it to other methods, invoke it multiple times. The `&` converts the block into a "simple" proc object. An implicit block can only be yielded to and tested with `#block_given?`. With an explicit block one has greater flexibility. For example:

```ruby
def method1(&block)
	puts 1
	method2(block)
	puts 5
end

def method2(block)
	puts 2
	block.call(3)
	puts 4
end

method1 {|n| puts n}           # => 1 2 3 4 5
```
### [Using Closures](https://launchschool.com/lessons/c0400a9c/assignments/5a060a20)
```ruby
def for_each_in(arr)
  arr.each { |element| yield element }
end

arr = [1, 2, 3, 4, 5]
results = [0]

for_each_in(arr) do |number|
  total = results[-1] + number
  results.push(total)
end

p results # => [0, 1, 3, 6, 10, 15]
```
The block is invoked within the `for_each_in` method and shouldn't have access to the `results` array, but it does through closure.

When methods return Procs we can do cool things :
```ruby
def sequence
  counter = 0
  Proc.new { counter += 1 }
end

s1 = sequence
p s1.call           # 1
p s1.call           # 2
p s1.call           # 3
puts

s2 = sequence
p s2.call           # 1
p s1.call           # 4
p s2.call           # 2
```
Note that each `sequence` call has its own copy of `counter`.

### [Summary](https://launchschool.com/lessons/c0400a9c/assignments/5a060a20)

- Blocks are one way that Ruby implements closures, which are chunks of code that can be passed around.
- Blocks won't complain if the wrong number of arguments are passed in.
- Blocks return a value.
- Blocks allow the method writer to defer implementation to the method caller.
- Blocks are good for 'sandwich code'.
- Methods and blocks can return procs/lambdas.
