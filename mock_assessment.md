[Sho's practice paper](https://github.com/W-Sho-Sugihara/RB139/blob/154a5266422be74bb45d3f07805f8a4614fbff98/study_questions.md)

BLOCKS

1, What are closures?

- Closures are chunks of code that can be passed around in, which retain a memory of the context in which tey were defined. In Ruby closures are created with blocks, procs and lambdas

2, What is binding?

- Binding is the list of artifacts that a closure makes a record of and keeps track of. These are the artifacts referenced in the closure at the point of creation. It can be variables, methods or other pieces of data.

3, How does binding affect the scope of closures?

- Objects included in a closure's binding are available to it in scopes where the artifacts themselves would not be. For instance if a closure is passed into a method, then the variables in the closure's binding would still be available to the closure even if they were not passed into the method.

4, How do blocks work?

-  Blocks are defined between two curly braces or the `do`,`end` keywords. They can take arguments, delineated between two pipes. Blocks have lenient arity, so they won't raise an exception if fewer or more arguments are passed to it. Extra block variables will be assigned to `nil` and extra arguments will be ignored. Blocks can be passed into methods either explicitly or implicitly. Explicitly means that the method is defined with it's final argument preceded by a `&` operator. This variable cna then be passed around assigned to other variables or passed into other methods. Otherwise the block is added at invocation outside the method's parentheses. In this case the method is either yielded to or ignored. There is more to say, but I see it will be covered in later questions

5, When do we use blocks? (List the two reasons)

- Sandwich code
- defer implementation

6, Describe the two reasons we use blocks, use examples.

-
-

7, When can you pass a block to a method? Why?

- 

8, How do we make a block argument manditory?

- save the block as a lambda. 2 ways are these:

```ruby
def method(block)
  block.call(1)
end

lambda1 = ->(x) { x**2 }
lambda2 = lambda {|x| x**2 }
lambda1.lambda? # => true
lambda2.lambda? # => true

p method(lambda1) # => 1
p method(lambda2) # => 1
```


9, How do methods access both implicit and explicit blocks passed in?

10, What is yield in Ruby and how does it work?

11, How do we check if a block is passed into a method?

- #block_given?

12, Why is it important to know that methods and blocks can return closures?

pass them around

13, What are the benifits of explicit blocks?



14, Describe the arity differences of blocks, procs, methods and lambdas.

Yes

15, What other differences are there between lambdas and procs? (might not be assessed on this, but good to know)

return escapes enveloping method for lambdas, procs return out of proc.


16, What does & do when in a the method parameter?

```ruby
def method(&var); end

convert a block to a proc
```

17, What does & do when in a method invocation argument?
```ruby
method(&var)
```
18, What is happening in the code below?
```ruby
arr = [1, 2, 3, 4, 5]

p arr.map(&:to_s) # specifically `&:to_s`

convert a proc to a block
```
19, How do we get the desired output without altering the method or the method invocations?
```ruby
def call_this
  yield(2)
end

# your code here: 

to_s = :to_i
to_i = :to_s

#

p call_this(&to_s) # => returns 2
p call_this(&to_i) # => returns "2"
```
20, How do we invoke an explicit block passed into a method using &? Provide example.



21, What concept does the following code demonstrate?
```ruby
def time_it
  time_before = Time.now
  yield
  time_after= Time.now
  puts "It took #{time_after - time_before} seconds."
end
```
sandwich code

22, What will be outputted from the method invocation block_method('turtle') below? Why does/doesn't it raise an error?
```ruby
def block_method(animal)
  yield(animal)
end

block_method('turtle') do |turtle, seal|
  puts "This is a #{turtle} and a #{seal}."
end
```
=> lenient arity

23, What will be outputted if we add the following code to the code above? Why?
```ruby
block_method('turtle') { puts "This is a #{animal}."}
24, What will the method call call_me output? Why?

def call_me(some_code)
  some_code.call
end

name = "Robert"
chunk_of_code = Proc.new {puts "hi #{name}"}
name = "Griffin"

call_me(chunk_of_code) # => hi Griffin
```
because in Ruby closures keep track of the artifacts in its binding. Because `name` was created before the `chunk_of_code` Proc, it keeps track of reassignment of it.

25, What happens when we change the code as such:
```ruby
def call_me(some_code)
  some_code.call
end

chunk_of_code = Proc.new {puts "hi #{name}"}
name = "Griffin"

call_me(chunk_of_code) # => undefined local variable error
```
26, What will the method-call call_me output? Why?
```ruby
def call_me(some_code)
  some_code.call
end

name = "Robert"

def name
  "Joe"
end

chunk_of_code = Proc.new {puts "hi #{name}"}

call_me(chunk_of_code) # => Hi Robert
```
27, Why does the following raise an error?
```ruby
def a_method(pro)
  pro.call
end

a = 'friend'
a_method(&a)
```
28, Why does the following code raise an error?
```ruby
def some_method(block)
  block_given?
end

bl = { puts "hi" }

p some_method(bl)
```
29, Why does the following code output false?
```ruby
def some_method(block)
  block_given?
end

bloc = proc { puts "hi" }

p some_method(bloc)
```
30, How do we fix the following code so the output is true? Explain
```ruby
def some_method(block)
  block_given? # we want this to return `true`
end

bloc = proc { puts "hi" } # do not alter this code

p some_method(bloc)
```
31, How does Kernel#block_given? work?

32, Why do we get a LocalJumpError when executing the below code? & How do we fix it so the output is hi? (2 possible ways)
```ruby
def some(block)
  yield
end

bloc = proc { p "hi" } # do not alter

some(bloc)
```
33, What does the following code tell us about lambda's? (probably not assessed on this but good to know)
```ruby
bloc = lambda { p "hi" }

bloc.class # => Proc
bloc.lambda? # => true

new_lam = Lambda.new { p "hi, lambda!" } # => NameError: uninitialized constant Lambda
```
34, What does the following code tell us about explicitly returning from proc's and lambda's? (once again probably not assessed on this, but good to know ;)
```ruby
def lambda_return
  puts "Before lambda call."
  lambda {return}.call
  puts "After lambda call."
end

def proc_return
  puts "Before proc call."
  proc {return}.call
  puts "After proc call."
end

lambda_return #=> "Before lambda call."
              #=> "After lambda call."

proc_return #=> "Before proc call."
```
35, What will #p output below? Why is this the case and what is this code demonstrating?
```ruby
def retained_array
  arr = []
  Proc.new do |el|
    arr << el
    arr
  end
end

arr = retained_array
arr.call('one')
arr.call('two')
p arr.call('three')
TESTING WITH MINITEST
```
36, What is a test suite?

37, What is a test?

38, What is an assertion?

39, What do testing framworks provide?

 In Ruby testing frameworks such as MiniTest and Rspec provide ways to write and automate tests for your code. MiniTest provides a list of assertions to test your code against your expectations. Minitest also provides setup and teardown methods to reduce repetition.

40, What are the differences of Minitest vs RSpec

These are both testing frameworks that allow a dev to write and automate tests for their program. Minitest is written in Ruby, Rspec uses a DSL which tries to mirror natural English. Minitest can do everything Rspec can do and their output is the same, it is only a question of how the dev prefers to write the tests. Minitest is a bundled Gem which means it is maintained outside of Rby's core library. It is also Ruby's default testing librarry.

41, What is Domain Specific Language (DSL)?

A DSL is a language created for a specific environment or task. Rspec uses a DSL. SQL is another. In contrast to general programming lamnguages like RUby and Python which are designed to be flexible and can be used for many different tasks

42, What is the difference of assertion vs refutation methods?

43, How does assert_equal compare its arguments?

44, What is the SEAT approach and what are its benefits?

45, When does setup and tear down happen when testing?

46, What is code coverage?

47, What is regression testing?

CORE TOOLS

48, What are the purposes of core tools?

Core tools are there to help developers with various tasks involved with the creation of programs. Some of these tasks are arduous or complicated and their automation saves devs time and energy. Bundler for example is a dependency manager that ensures that a project is using the right version of ruby and has the necessary gems installed. In this section of the course we have learnt about Rake, RubyGems and Ruby Version Managers as well.

49, What are RubyGems and why are they useful?

Ruby gems are packages of code available for download from the Ruby Gems website. Each gem provides a different fundtiuon and so is useful in a different way. For indstance, the Rubocop gem scans a program and checks for formatting and other errors. It comes with various commands to do with this process. There are hundreds of RubyGems and they are a key part of writing programs in Ruby.

50, What are Version Managers and why are they useful?

51, What is Bundler and why is it useful?

52, What is Rake and why is it useful?

53, What constitues a Ruby project?
