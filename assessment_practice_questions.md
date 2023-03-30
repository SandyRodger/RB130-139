# RB139 Assessment Practice Questions

These questions are taken from [here](https://github.com/SandyRodger/rb130_139/blob/main/study_guide/practice_questions.md)

## Blocks

1. What are closures?

  -  [Closures](https://launchschool.com/lessons/c0400a9c/assignments/0a7a9177) are savable chunks of code, which keep a reference to the artifacts it references at the time of creation.
  -   In Ruby closures are created with Blocks, Procs and Lambdas. 
  -   The artifacts which are saved can be variables, methods, objects or other pieces of code. This list of references is called its binding.
  -   One can think of closures as methods which can be nameless.

2. What are blocks?

- In Ruby blocks are chunks of code defined between curly braces or the `do` and `end` keywords. 
- Every method in Ruby can take a block as an implicit argument, but unless the method yields to the block, it will be ignored.
- Blocks can have arguments. These are defined between pipes.

3. What are Procs and lambdas? How are they different?

- A proc object is an encapsultation of a block of code. A lambda is a type of Proc.
- Procs can be created in 3 ways:
  - Proc#new method followed by a block `Proc.new {|x| x * 2}`
  - Using Kernel#proc as a shorthand for Proc#new: `proc {|x| x * 2}`
  - Passing a block to a method with `&`
```ruby
def make_proc(&block)
  block
end

proc3 = make_proc {|x| x**2 }
```

  - lambdas can be created in 2 ways:
    - Kernel#lambda: `lambda1 = lambda {|x| x**2 }`
    - Lambda literal syntax: `lambda2 = ->(x) { x**2 }`
- Procs and Lambdas are both objects of the Proc class. Lambdas can be thought of as Procs with special features.
- Here are the key differences:
  - `return` in a Lambda means exit this lambda. In a Proc it means exit the embracing method - EMBRACING METHOD MEANS WHERE THE PROC WAS DEFINED - NOT INVOKED.
```ruby
def call_it(ex)
  ex.call # => proc
  puts "Leaving call_it"
end

def call_the_caller(ex)
  call_it(ex)
  puts "Leaving call_the_caller"
end

def meth_proc
  p = Proc.new { puts('proc'); return }
  call_the_caller p
  puts "I'm in meth_proc"
end

def meth_lambda
  l = lambda { puts('lambda'); return }
  call_the_caller l
  puts "I'm in meth_lambda"
end

meth_proc # => proc
puts "Returned from meth_proc" # => Returned from meth_proc
puts # => empty line
meth_lambda # => lambd
            # => Leaving call_it
puts "Returned from meth_lambda" # =>  Returned from meth_lambda
```
  - Arity - Lambdas are like methods: strict arity. procs are like blocks: lenient arity.

4. How do closures interact with variable scope?

- A block creates a new scope for its variables with turtle-shell rules - they can see out, outside can't see in.
- Whatever artifacts are in scope at creation are saved to the closure's binding. The binding keeps track of these objects, so if they are mutated or reassigned the closure has access to the new values.
- This can lead to seeming breaches of block scoping rules. For instance:

```ruby
def introduce_yourself(introduction)
  introduction.call
end

me = "Sandy"

my_bit = Proc.new { puts "Hello, my name is #{me}." }

introduce_yourself(my_bit)
# Hello, my name is Sandy.
```
- The local variable `me` has not been passed into #introduce_yourself. But the proc `my_bit` has, and that has access to `me` via its binding.

6. What are blocks used for? Give examples of specific use cases

- Defer implementation: If you don't know exactly how a method will be used a block is a good way to defer decision-making until invocation. For instance:

``` ruby
def iterate_over(array)
  array.each {|n| yield(n)}  # do something to each element in the array, I don't know what.
end

arr = [1, 2, 3, 4, 5]

iterate_over(arr) {|n| p n * 5} # The person calling the method decides to multiply each number by 5 and print the result.

arr.each {|n| p n * 5}  # and this is in fact why the #each method is built as it is.
# Another example would be:

p ['fox', 'monkey', 'sheep'].max_by{|word| word.length} # => "monkey"
```
- Sandwich code: Any method which has to perform something before and after some implementation.

```ruby
def sandwich_demo
  start = Time.now
  yield
  finish = Time.now
  puts "This method took #{finish - start} seconds"
end

sandwich_demo { sleep 2 } # => This method took 2.001611 seconds
```

7. How do we write methods that take a block? What errors and pitfalls can arise from this and how do we avoid them?

- In Ruby a method can either take an explicit or implicit block. An explicit block must be written into the method definition as its last argument, preceded by a `&`. The `&` operator converts the block to a proc object which can then be called in the method (without the preceding &) with the `Proc#call method`.
```ruby
def explicit_block_demo(arg_1, arg_2, &block)
  block.call(arg_1, arg_2)
end

explicit_block_demo(1, 2){|a, b| puts "#{a} and #{b}"} # => 1 and 2
```

- Implicit blocks can be passed to all Ruby methods, but if that method does not yield to a block, the block will be ignored.
- Pitfalls in writing methods that take blocks are the following:
  - if the method doesn't yield, the block won't be called. 
  - [ I need to do more research here ]

8. How do we utilize the return value of a block? How can methods that take a block pass pieces of data to that block?

- Blocks return the last value they evaluate, just like methods. So they can be saved, or chained on to other methods just like method-calls. Methods pass data to blocks with the `yield` keyword. `yield` causes the block to be invoked. It can take arguments. Blocks have lenient arity so the `yield` arguments don't have to match the block arguments.

9. What is Symbol#to_proc and how is it used?

- Symbol#to_proc is a method that transforms a symbol method-name into a proc object which can then be used in a method.

```ruby
def proc_to_block(proc)
  p proc.class
  p [1, 2, 3, 4, 5].any?(&proc) # => #any? expects a block.
end

def block_to_proc(&block)
  yield # => the block is still there to be yielded to
  block.call # => but the unary & operator has converted the block into a proc object also
end

block_to_proc { puts "from a block"} # => from a block
                                     # => from a block
my_proc = proc {|n| n > 4}
proc_to_block(my_proc) # => Proc
                       # => true
```

The lesson is that & in definition expects a block and returns a Proc. But in invocation it expects either a symbol or a proc and it returns a block. Think of it like a lightswitch that inverts the input depending on what it is. But also on where it is. 

10. How do we specify a block argument explicitly?

- `&` see example above.

11. How can we return a Proc from a method or block?

- Have a Proc be the last thing evaluated in the method. Then it will be the return value of the block or method.

12. What is arity? What kinds of things in Ruby exhibit arity? Give explicit examples.

- Arity is how strictly the number of arguments in a method/block/proc/lambda invocation have to follow the number of parameters set out at definition. Blocks and Procs have lenient arity. That means you can pass in fewer or more arguments than parameters and the block/proc will still function either ignoring extra arguments or assigning extra parameters to `nil`. Methods and Lambdas have strict arity. That means they will raise an exeption if the number of arguments passed in does not match the number of parameters. See example below:

```ruby
# LENIENT ARITY (procs and block)

# my_proc = proc {|a, b, c| p [a, b, c]}
# my_proc.call("elephant") # => ["elephant", nil, nil]
# my_proc.call("elephant", "cat") # => ["elephant", "cat", nil]
# my_proc.call("elephant", "cat", "sheep") # => ["elephant", "cat", "sheep"]
# my_proc.call("elephant", "cat", "sheep", "horse") # => ["elephant", "cat", "sheep"]

# STRICT ARITY (lambdas and methods)

my_lambda = ->(a, b, c) {p [a, b, c]} 
my_lambda.call("elephant", "cat", "sheep") # => ["elephant", "cat", "sheep"]
# my_lambda.call("elephant", "cat") # =>  wrong number of arguments (given 2, expected 3) (ArgumentError)
my_lambda.call("elephant", "cat", "sheep", "dog") # =>  wrong number of arguments (given 4, expected 3) (ArgumentError)

```

## Testing

1. What is Minitest? How do we get access to it?

- Minitest is an in-built Gem that comes with Ruby. Its function is to test the public methods in a program. Get access to it with the following steps:
  - If it is not present on your machine you can install it with: `gem install minitest`.
  - Then type `require 'minitest/autorun'` at the top of your test program.
  - Create a class of tests which inherits from `Minitest::Test`
  - Within that class define methods prepended with `test_`.
  - Run the test file from the command line with `ruby` command.

2. What are the different styles of Minitest?

- Assert style and Expectation-style. In Assert-style you write tests similarly to methods between`def` and `end` and the method name is prepended with `test_`. In spec-style we group tests into `describe` blocks and use the `it` method to write tests.

4. What is RSpec? How does it differ from Minitest?

- RSPEC is a Domain Specific Language for writing tests in Ruby. It uses a syntax that aims to mirror natural English where MiniTest is written in plain ruby.
- Minitest comes as the default testing library with Ruby. RSPEC does not.
- Rspec uses expectation matchers rather than assertions.
- The output of Minitest and RSPEC are the same, they are only written differently.

5. What is a test suite? What is a test?

- A test suite is a group of tests. The collection is wrapped in a class that inherits from MiniTest. Each test is defined between the `def` and `end` keywords and the test name is prepended with `test_`. Within each test assertions are run to compare the expected outcome of a method with the actual outcome. A test can contain more than one assertion.

6. What are assertions? How do they work?

- Assertions are methods in the MiniTest module that compare the expected output of a method with the actual output. The most basic is `#assert(value)` which simply tests whether the argument returns a truthy value or not. 

7. Give some examples of common assertions and how they are used.

- Besides the example above, common assertions are as follows:
  - 'assert_equal(exp, act)` the first argument is the expected value and the second value is the actual value. it might look like this, for example:
      ```ruby
      def test_add_2
         assert_equal(4, add_2(2))
       end
       ```
  - `assert_nil(val)` fails unless the return value is `nil`
     ```ruby
     def test_name_is_nil
        car = Car.new
        assert_nil(car.name)
     end
     ```
   - `assert_raises(*exp) {...}` tests whether the block raises the expected Error message.
      ```ruby
        def test_raise_initialize_with_arg
          assert_raises(ArgumentError) do
            car = Car.new(name: "Joey")         # this code raises ArgumentError, so this assertion passes
          end
        end
      ```

8. What is the SEAT approach?

- SEAT stands for Set-up, Execute, Assert, Tear-down. It describes the process of creating a test-suite. The Set-up method creates the objects to be tested. The Execute step executes the code with the test objects. The assert step asserts whether or not the code ran as expected. The tear down step removes the things created in the set-up step. Tear down is also the time for logging information and closing database connections.

9. What is code coverage and how is it used? What tools can you use to gauge code coverage for yourself?

- Code coverage refers to how much of a program is tested by a test suite. One tool available for this is `simplecov` which is a ruby gem that checks how many of the public methods are run by the test suite. It does not test whether the tests work properly, only whether the method has a test. There are more complex tools for testing code-coverage, for instance by testing the all brancing logic of a method. Code coverage is one way of guaging the quality of some code.

## Core Ruby Tools

1. What are RubyGems? How are they used? Where can you find them? How do you manage them in your own environment? How do you include them in projects you create?

- Ruby Gems are packages of code that can be downloaded and run from a Ruby file or the Command line. You can download them with the `gem install` command and then including `require [gem-name]` in your ruby program. They are to be found on the Ruby Gems website.

2. What is the RubyGems format for projects?

- When you run `gem install [ruby gem]` RubyGems installs the gem in the local library. Where the local library is depends on 2 things
  -  what ruby version you are using
  -  whether you are using a ruby version manager like RVM or rbenv
-  `gem env` will print out the following information about your RubyGems installation:
  - which ruby version is associated with the gem command
  - the location of the `ruby` command you should use with this `gem` command
  - where `gem` installs gems
  - AND MORE!
-  You can use the gems you have installed by including `require <gem-name>` at the beginning of your program.

3. What are Ruby Version Managers? Why do we need them? Give some examples of available Ruby Version Managers and what they can do for you.

- Ruby Version Managers  are programs that help you to install, manage and organize multiple versions of Ruby on the same local system. We need them because Ruby as a language is constantly changing and being updated, so a program we write for one version of Ruby may not work perfectly with a diffrent version. So we need to guarantee that the Ruby we're using with a prgram is the exact one we need. Another situtation would be if different developers are working on the same program, it would be necessary to standardise the version of Ruby being used by everyone. Or working on different projects that each require a different version of Ruby.
- Two options for Ruby Version Managers are rbenv and RVM.
  - RVM includes more features and works by dynamically changing your development environment
  - rbenv has fewer features, but allows you to install more plugins that extend functionality. Works mostly by modifying you environment variables (such as $PATH.

4. What is Bundler? What does it do and why is it useful?

- Bundler is a Gem that works as a dependency manager. It helps simplify the installation and environment usage of multiple versions of Ruby and gems.
- It allows you to specify which version of gems and ruby you want to use with a particular program.
- It allows you to install multiple gems under one version of ruby for a project.

5. What is Rake? What does it do and why is it useful?

- Rake is a RubyGem that automates common and repetitive actions, such as pushing to git or running tests.

6. What is a .gemspec file?

- .gemspec is a special file included in all Gem projects. It provides information such as name, summary, authors, contact info etc about a released Gem. If you want to release a program or library as Gem you must include a .gemspec file.


7. How do the Ruby tools relate to one another?

- [Answer](https://launchschool.com/books/core_ruby_tools/read/conclusion#relationships)
-  Ruby Version Managers help to manage install and organize different versions of Ruby and Gems. Bundler

## Regex

1. What are patterns?
2. How do you define a regex?
3. What is concatenation in regex? How is it achieved?
4. What is alternation in regex? How is it achieved?
5. What are a few examples of the most basic kind of regex patterns?
6. What is a meta-character? How do you deal with them in regex? List a few exampled.
7. What is a character class? How are they created? Give specific examples.
8. How are meta-characters different inside and outside of a character class?
9. What is an anchor? What, specifically, do you have to watch out for with anchors when it comes to Ruby regex?
10. What is a quantifier? How do they operate? Give explicit examples.
11. What is a capture group and how is it used?
12. How do you test a string against a regex?
13. How can you split strings into multiple items with a regex?
14. How do you construct new strings from existing strings?
