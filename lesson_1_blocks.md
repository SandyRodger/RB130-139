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
- [Writing methods which take blocks - Summary](#summary)
- [Walk-through: Build a 'times' method](#walk-through-build-a-times-method)
- [Walk-through: Build an each method](#walk-through-build-an-each-method)
- [Assignment: Build a 'select' method](#assignment-build-a-select-method)
- [Assignment build a reduce method](#assignment-build-a-reduce-method)
- [Assignment: TodoList](#assignment-todolist)
- [Blocks and Variable Scope](#blocks-and-variable-scope)
- [Symbol to proc](#symbol-to-proc)
- [Lesson 1 Summary](#lesson-1-summary)
- [Quiz](#quiz)

### [Closures](https://launchschool.com/lessons/c0400a9c/assignments/0a7a9177)

 - [Ginni says...](https://github.com/SandyRodger/rb130_139/blob/main/study_guide/blocks.md#closures)
 -  A save-able "chunk of code". It binds the artifacts around it (like in Microsoft Excel, copying and pasting a cell with its references ) and builds an "enclosure" around them. Whatever methods, variabes etc. are within scope at the moment of saving remain in scope when the closure is called at a later time. It is comparable to a method you've defined, which can be passed around. These references to its surrounding objects are called its **binding**. 

In Ruby a closure is handled with a Proc, Block or Lambda. Proc is a [class](https://docs.ruby-lang.org/en/2.6.0/Proc.html) which can instantiate proc objects, the other two are not.

#### More detail:
 - Closures keep track of the objects in their binding
 - A lambda is a sort of Proc.

#### Example 1:

<img width="967" alt="Screenshot 2023-03-09 at 09 41 11" src="https://user-images.githubusercontent.com/78854926/223982527-3916e07a-21f5-4fd5-82a7-830dd1c40354.png">

Here I define the `dinosaurs` method so that it returns a proc object. This proc makes a closure containing local variables `idx` and `dinos`. The `dinosaurs` method is invoked on line 12 and saved to the local variable `dinos1`. Thus assigned we can call the proc with the `#call` method. This copy of the proc has its own unique 'idx' and 'dinos' variables, so we can create a second proc, saved to `dinos2`, and the `#call` method proves that the closures are seperate.

#### Example 2:

<img width="776" alt="Screenshot 2023-03-09 at 10 17 12" src="https://user-images.githubusercontent.com/78854926/223992584-ca25c668-7956-4849-b535-f62338f4303f.png">

In this example `i_yam` is not passed into the method and so should not be available, but it is available because the block has saved its reference as part of its binding.
### Example 3:

<img width="1086" alt="Screenshot 2023-03-09 at 10 24 30" src="https://user-images.githubusercontent.com/78854926/223995627-c4ad31a8-7c6a-4fdf-9dc4-9225e11c5094.png">

This example is almost identical to example 2, but returns an error message because in order for a variable to be saved in a closure it has to have already been initialized when the closure is created.

### Example 4:

<img width="739" alt="Screenshot 2023-03-09 at 10 27 35" src="https://user-images.githubusercontent.com/78854926/223996690-a61f319e-c0ac-4f5c-ad7d-6042b2ac3f13.png">

However, if the closure has captured a local variable, it will keep track of any reassignment

#### Ginni now reviews [variable scope and binding](https://github.com/SandyRodger/rb130_139/blob/main/study_guide/blocks.md#variable-scope-and-binding)

- A block creates a new scope for local variables. A local variable initialized in outer scope is available in inner scope, but not the other way around. (Remember the Japanese public toilet).
- "Closures keep track of which local variables are in scope via a binding". 
- Bindings keep track of:
  - Method definitions
  - Constants
  - Local variables
  - Anything it needs to function
- "Basically, the closure will **bind** and drag around with it anything it needs to function correctly.

### [Calling methods with blocks](https://launchschool.com/lessons/c0400a9c/assignments/ff802368)

[Ginni says](https://github.com/SandyRodger/rb130_139/blob/main/study_guide/blocks.md#writing-methods-that-take-blocks)

 - All Ruby methods can take a block, but some ignore them, some use them for selection/ transformation etc.
 - 
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

In these three examples the blocks return their calling object or a new object according to the block. Sometimes the block's code affects the return value and sometimes not - and that is what we need to focus on now.

The code in the block is not the method implementation. It is passed into the method and the method decides what to do with it. Often looking at the documentation and experimenting is the best way to understand how a particular method treats a block.

### [Writing methods that take blocks](https://launchschool.com/lessons/c0400a9c/assignments/5a060a20)

[Ginni says](https://github.com/SandyRodger/rb130_139/blob/main/study_guide/blocks.md#writing-methods-that-take-blocks)

 - The `yield` keyword allows you or any future dev to "inject" a section of code and modify the method call. 
  
In Ruby every method can take an optional block as an implicit argument.

```ruby
puts("boy"){puts "girl"} # => "boy" : It took the block, but didn't run it, because it was not yielded to.
```

```ruby
def hello
  puts "hello!"
end

hello { puts 'hi' } # => hello!
```

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

Arity is the rule of how many arguments you must pass to a block/proc/lambda.

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


There is a **method writer** and a **method caller** and they could be the same person. If the method writer wants to leave some decisions to the method caller they can do so with a block.
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
Another very important use for sandwich code is resource management. Many OS interfaces require the developer to first allocate a portion of a resource and after to clean up and free that resource. Omitting this process can lead to system crashes, memory leaks and file system corruption.

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
The block is invoked within the `for_each_in` method and shouldn't normally have access to the `results` array, but it does through closure.

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

### [Walk-through Build a times method](https://launchschool.com/lessons/c0400a9c/assignments/cd792c69)
```ruby
# method implementation
def times(number)
  counter = 0
  while counter < number do
    yield(counter)
    counter += 1
  end

  number                      # return the original method argument to match behavior of `Integer#times`
end

# method invocation
times(5) do |num|
  puts num
end

# Output:
# 0
# 1
# 2
# 3
# 4
# => 5
```
### [Walk-through Build an each method](https://launchschool.com/lessons/c0400a9c/assignments/c7af0c78)
```ruby
def each(array)
  counter = 0

  while counter < array.size
    yield(array[counter])                           # yield to the block, passing in the current element to the block
    counter += 1
  end

  array                                             # returns the `array` parameter, similar in spirit to how `Array#each` returns the caller
end

each([1, 2, 3, 4, 5]) do |num|
  puts num
end

# 1
# 2
# 3
# 4
# 5
# => [1, 2, 3, 4, 5]
```
### [Assignment build a select method](https://launchschool.com/lessons/c0400a9c/assignments/5bc68af0)
```ruby
array = [1, 2, 3, 4, 5]

def select(arr)
	arr.each_with_object([]) do |n, output| 
		output.push(n) if yield(n)
	end
end

p select(array) { |num| num.odd? }      # => [1, 3, 5]
p select(array) { |num| puts num }      # => [], because "puts num" returns nil and evaluates to false
p select(array) { |num| num + 1 }       # => [1, 2, 3, 4, 5], because "num + 1" evaluates to true
```
### [Assignment build a reduce method](https://launchschool.com/lessons/c0400a9c/assignments/c1edc867)


```ruby
array = [1, 2, 3, 4, 5]

def reduce(arr, a=0)
	output = a
	arr.each do |n|
		output = yield(output, n)
	end
	output
end

p reduce(array) { |acc, num| acc + num }                    # => 15
p reduce(array, 10) { |acc, num| acc + num }                # => 25
p reduce(array) { |acc, num| acc + num if num.odd? }        # => NoMethodError: undefined method `+' for nil:NilClass
```
A tricky example of `#reduce`:

```ruby
[1, 2, 3].reduce do |acc, num|
  p "acc is #{acc}"
  p "."
  p "num is #{num}"
end

# "acc is 1"
# "."
# "num is 2"
# "acc is num is 2"
# "."
# "num is 3"
```
What we're seeing is two iterations through the array. On the first iteration `acc` is 1 and `num` is 2. On the second iteration `acc` is "num is 2" and `num` is 3. Which is exactly what it prints.

### [Assignment TodoList](https://launchschool.com/lessons/c0400a9c/assignments/b2926256)
[my todo list](https://github.com/SandyRodger/RB130-139/blob/main/01_course_exercises/01_lesson_1_blocks/03_todo.rb)
### [Assignment TodoList with each](https://launchschool.com/lessons/c0400a9c/assignments/490f885c)
[my todo list with each](https://github.com/SandyRodger/RB130-139/blob/main/01_course_exercises/01_lesson_1_blocks/07_todo_each_2.rb)
### [Assignment TodoList with select](https://launchschool.com/lessons/c0400a9c/assignments/b57d3600)
[my todo list with select](https://github.com/SandyRodger/RB130-139/blob/main/01_course_exercises/01_lesson_1_blocks/06_todo_select_2.rb)
### [Assignment TodoList more methods](https://launchschool.com/lessons/c0400a9c/assignments/f7185b37)
[my todo list with more methods](https://github.com/SandyRodger/RB130-139/blob/main/01_course_exercises/01_lesson_1_blocks/08_more_todo_methods.rb)

### [Blocks and Variable Scope](https://launchschool.com/lessons/c0400a9c/assignments/fd86ea2e)

Remember that with blocks you can see out, but not in:
```ruby
level_1 = "outer-most variable"

[1, 2, 3].each do |n|                     # block creates a new scope
  level_2 = "inner variable"

  ['a', 'b', 'c'].each do |n2|            # nested block creates a nested scope
    level_3 = "inner-most variable"

    # all three level_X variables are accessible here
  end

  # level_1 is accessible here
  # level_2 is accessible here
  # level_3 is not accessible here

end

# level_1 is accessible here
# level_2 is not accessible here
# level_3 is not accessible here
```
(This can be confusing because method invocation without parentheses looks like local variable referencing.)

### [Closure and binding](https://launchschool.com/lessons/c0400a9c/assignments/fd86ea2e)

Closures keep a memory of artifacts in their scope. In the example below this supercedes method scoping rules and allows the `name` local variable to be available within the method without being passed in.

```ruby
def call_me(some_code)
  some_code.call    # call will execute the "chunk of code" that gets passed in
end

name = "Robert"
chunk_of_code = Proc.new {puts "hi #{name}"}

call_me(chunk_of_code) # => hi Robert
```
Even reassigning `name` after the proc is created is accurately reflected in the proc call. **Closures keep track of their binding**.
```ruby
def call_me(some_code)
  some_code.call
end

name = "Robert"
chunk_of_code = Proc.new {puts "hi #{name}"}
name = "Griffin III"        # re-assign name after Proc initialization

call_me(chunk_of_code) # => hi Griffin III
```
Binding includes all artifacts of code (methods, variables, constants etc), but they have to have already been created when the closure is made (unless they're passed in as arguments). So this doesn't work:
```ruby
def call_me(some_code)
  some_code.call
end

chunk_of_code = Proc.new {puts "hi #{name}"}
name = "Griffin III"        # re-assign name after Proc initialization

call_me(chunk_of_code) # => NameError
```
### [Symbol to proc](https://launchschool.com/lessons/c0400a9c/assignments/26d715d8)
This:
```ruby
[1, 2, 3, 4, 5].map do |num|
  num.to_s
end

# => ["1", "2", "3", "4", "5"]
```
can be written like this:
```ruby
[1, 2, 3, 4, 5].map(&:to_s)                     # => ["1", "2", "3", "4", "5"]
```
This doesn't work for methods which take arguments.

It can substitute blocks:
```ruby
["hello", "world"].each(&:upcase!)              # => ["HELLO", "WORLD"]
[1, 2, 3, 4, 5].select(&:odd?)                  # => [1, 3, 5]
[1, 2, 3, 4, 5].select(&:odd?).any?(&:even?)    # => false
```
What is happening behind the scenes is:

```ruby
(&:to_s)
```
is becoming
```ruby
{ |n| n.to_s }
```
The `&` operator tells Ruby to call `#to_proc` on the symbol and then convert that proc to a block.

### [Lesson 1 Summary](https://launchschool.com/lessons/c0400a9c/assignments/b4fb9b1c)

- Ruby implements closures through blocks, procs and lambdas.
- Closures drag their binding around with them. This is central to how variables are scoped.
- Blocks can defer decisions to when the method is called.
- Blocks are great for 'before and after' logic.
- We can use `yield` to include blocks in our methods.
- With `yield` we can pass arguments to the block.
- Blocks have return values which we have to be aware of.
- Blocks can be used to re-write Ruby methods in our own classes.
- `symbol#to_proc` is a nice shortcut.
- We can return closures from methods/blocks.

### [Quiz](https://launchschool.com/quizzes/6b2ec033)

| Q | 1st attempt | 2nd Attempt | 3rd Attempt(24th March)
| :---: | :---: | :---: | :---: |
|1. |       ✔     |      ✔      |      ✔
|2. |       ✔     |      ✔      |      ✔
|3.  |       X     |      ✔      |      X
|4.  |       ✔     |      ✔      |      ✔
|5.  |       X     |      ✔      |      X
|6.  |       ✔     |      ✔      |      ✔
|7.  |       X     |      ✔      |      ✔
|8.   |       X     |      ✔      |      ✔
|9.   |       ✔     |      ✔      |      ✔
|10.  |       ✔     |      ✔      |      ✔
|11.  |       ✔     |      ✔      |      ✔
|12.  |       X     |      ✔      |      X
|13.   |       ✔     |      X      |      X
| 14. |       ✔     |      ✔      |      ✔
| 15.   |       X     |      ✔      |      ✔
| total: |      60%    |      94%    | 73%

Question 13 mistake:

```ruby
"the cat in the hat".split.map(&:capitalize).join(' ') # => "The Cat In The Hat"
```
This code causes `Symbol#to_proc` to be called, but not `Block#to_proc`
                  
Question 3 mistake:

Passing a block to a method does create a closure

Question 5 mistake:

Methods that take a block don't have to use `yield` 

Any Ruby method can take a block

Question 12:

When the binding is created `color` is not included, so an error will be raised.
