# [Introduction to Testing](https://launchschool.com/lessons/dd2ae827/assignments)

Contents:

- [Introduction](#introduction)
- [Setting up Minitest](#setting-up-minitest)
- [Lecture: Minitest](#lecture-minitest)
- [How to make a test](#how-to-make-a-test)
- [Expectation syntax](#expectation-syntax)
- [Minitest summary](#minitest-summary)
- [Assertions](#assertions)
- [Refutations](#refutations)
- [SEAT](#seat)
- [Testing Equality](#testing-equality)
- [Equality with custom class](#equality-with-custom-class)
- [Assignment: write a test suite for Todo List](#assignment-write-a-test-suite-for-todo-list)
- [Code coverage](#code-coverage)
- [Exercises More topics](#exercises-more-topics)
- [proc to block operator](#proc-to-block-operator)
- [capturing input/output](#capturing-input-and-output)
- [blocks, procs and lambdas](#blocks-procs-and-lambdas)

### [Introduction](https://launchschool.com/lessons/dd2ae827/assignments/554f5ac5)

Why do we write tests? To prevent regression. (This is the beginners answer, sufficient for now)

- Testing can become very complicated when considered in the context of work-flows, frameworks and different tools. So this is a simplified lesson on testing, which can be called 'unit-testing'.
- The Ruby default testing library is 'Minitest', which this lesson will use.
- There is a lot of testing jargon, it will be ignored in this lesson. Later we can build more complex methodologies and tools upon this foundation.

### [Setting up Minitest](https://launchschool.com/lessons/dd2ae827/assignments/6bf3c66c)

```ruby
gem install minitest # => installs Minitest

gem list minitest # => lists which version of Minitest you have installed

$ gem install minitest-reporters. # => This is not necessary, but adds colour to make the outpout more readable.

# then create a file in which to write your tests

# in temp.rb
require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

class MyFirstTest < Minitest::Test
  def test_first_test
    assert true
  end
end

# and run it from the command line like so:

$ ruby temp.rb
Run options: --seed 30741

# Running:

MyFirstTest .  # minitest/reporters omits this line.

Finished in 0.001034s, 967.2303 runs/s, 967.2303 assertions/s.

1 runs, 1 assertions, 0 failures, 0 errors, 0 skips


```

### [Lecture Minitest](https://launchschool.com/lessons/dd2ae827/assignments/3a8a5aa5)

- Some people prefer RSPEC, which uses a **Domain Specific Language** or DSL. But RSPEC implements its own language to make it sound more like spoken English, while Minitest remains simpler and can be written in plain Ruby.
- Mini test is a **bundled gem**.

#### Jargon:
- *test suite* : all the tests that accompany your project.
- *test* : this describes the context in which your tests are run. A test can contain multiple assertions.
- *assertion* : this is the actual verification step to confirm that the data returned is what was expected.

### How to make a test:

1. Create a file to be tested:

We will call the file monster.rb

```ruby
class Monster
	attr_reader :teeth
	def initialize(teeth)
		@teeth = teeth
	end

end

```
2. In the same directory create  a test file.

We will call it monster_test.rb

```ruby
require 'minitest/autorun'
require_relative 'monster'

class MonsterTest < Minitest::Test   # The test class must subclass Minitest::Test, to inherit the methods needed.
	def test_teeth                     # The tests are written as methods beginnning with 'test_' (by convention)
		monster = Monster.new(200)       # We set up the objects to assert against.
		assert_equal(200, monster.teeth) # Within each test we must include at least one assertion.
	end
  
   def test_bad_teeth
    skip                             # This is how you skip a test. You can also pass it a string argument to be displayed.
    monster = Monster.new(100)       
		assert_equal(200, monster.teeth)
  end
  
end
```
The output should be as follows:
```ruby
$ ruby monster_test.rb

Run options: --seed 24400.   # This 'seed' tells you in what order the tests were run.

# Running:

.                        # This dot is important. It tells you that everything ran without a problem. Here will be an 'S' if you skip a test and an 'F' if you fail one.

Finished in 0.001167s, 856.8980 runs/s, 856.8980 assertions/s.

1 runs, 1 assertions, 0 failures, 0 errors, 0 skips
```
### [Expectation syntax](https://launchschool.com/lessons/dd2ae827/assignments/3a8a5aa5)

The first part of this page is about *assertion* (*asset-style*) syntax. You can also use *expectation* (*spec-style*) syntax. In expectation style we group tests into `describe` blocks and tests are written with the `it` method. Instead of assertions, we use *expectation matchers*.

Here is a file of tests:

```ruby
require 'minitest/autorun'

require_relative 'car'

describe 'Car#wheels' do
  it 'has 4 wheels' do
    car = Car.new
    _(car.wheels).must_equal 4           # this is the expectation
  end
end
```
This will output the same as assertion style. It is purely a stylistic choice. (Expectation-style mirrors RSpec's syntax). In this course we stick to assertion-style.

### [Minitest summary](https://launchschool.com/lessons/dd2ae827/assignments/3a8a5aa5)

- Minitest is a library of tests that comes installed with Ruby.
- Using Minitests is very easy and you can play around with it.
- Create a test file
- Create a test class inheriting from `MiniTest::Test`
- Create tests that start with `test_`
- Create assertions with `assert_equal` comparing expected value and actual value.
- Colorize Minitest with `minitest-reporters`.
- `skip` tests.
- Assertion-style v. expectation style.

### [Assertions](https://launchschool.com/lessons/dd2ae827/assignments/fe2ff54a)

`assert_equal` is the do-it-all assertion, but learn the most common assertions and you should be good.

[full list of assertions](http://docs.seattlerb.org/minitest/Minitest/Assertions.html)

Commmon assertions:
- `assert(test)` : fails unless `test` is truthy.
```ruby
def test_car_exists
  car = Car.new
  assert(car)
end
```
- `asset_equal(exp, act)` : fails unless `exp == act`.
```ruby
def test_wheels
  car = Car.new
  assert_equal(4, car.wheels)
end
```

- `assert_nil(obj)` : fails unless `obj` is `nil`.

```ruby
def test_name_is_nil
  car = Car.new
  assert_nil(car.name)
end
```

- `assert_raises(*exp){...}` : fails unless block raises one of `*exp`.

```ruby
def test_raise_initialize_with_arg
  assert_raises(ArgumentError) do
    car = Car.new(name: "Joey")         # this code raises ArgumentError, so this assertion passes
  end
end
```

- `assert_instance_of(cls, obj)` : fails unless `obj` is and instance of `cls`.

```ruby
def test_instance_of_car
  car = Car.new
  assert_instance_of(Car, car)
end
```

- `assert_includes(collection, obj)` : Fails unless `collection` includes `obj`.

```ruby
def test_includes_car
  car = Car.new
  arr = [1, 2, 3]
  arr << car

  assert_includes(arr, car)
end
```

### [Refutations](https://launchschool.com/lessons/dd2ae827/assignments/fe2ff54a)

These are the opposite of the assertions. Every `assert` has a corresponding `refute`. They're rarely used.

### [SEAT](https://launchschool.com/lessons/dd2ae827/assignments/5c80633e)

- Set up the objects to be tested.
- Execute the code with the test objects.
- Assert that the code ran correctly.
- Tear-down and clean up remaining artifacts.

`setup` instance method:
```ruby
require 'minitest/autorun'

require_relative 'car'

class CarTest < MiniTest::Test
  def setup
    @car = Car.new
  end

  def test_car_exists
    assert(@car)
  end

  def test_wheels
    assert_equal(4, @car.wheels)
  end

  def test_name_is_nil
    assert_nil(@car.name)
  end

  def test_raise_initialize_with_arg
    assert_raises(ArgumentError) do
      Car.new(name: "Joey")      # we can't use the ivar from setup here because the Car object takes arguments.
    end
  end

  def test_instance_of_car
    assert_instance_of(Car, @car)
  end

  def test_includes_car
    arr = [1, 2, 3]
    arr << @car

    assert_includes(arr, @car)
  end
end
```
You may be able to get away with only EA of SEAT.

[Here is an exercise about using Setup and Teardown to analyse a text file](https://launchschool.com/exercises/82427de8) which I need to review.

## [Testing Equality](https://launchschool.com/lessons/dd2ae827/assignments/bcce2222)

What are we saying is equal?

`assert_equal` tests for *value equality* with `==`.

`assert_same` tests for *object equality*

```ruby
require 'minitest/autorun'

class EqualityTest < Minitest::Test
  def test_value_equality
    str1 = "hi there"
    str2 = "hi there"

    assert_equal(str1, str2)    # => passes
    assert_same(str1, str2)     # => fails
  end
end
```

### [Equality with custom class](https://launchschool.com/lessons/dd2ae827/assignments/bcce2222)

`assert_equal` will call `==` and revert to the definition found in a parent class, but for custom classes we need to tell Minitest how to compare.

```ruby
class Car
  attr_accessor :wheels, :name

  def initialize
    @wheels = 4
  end

  def ==(other)                       # assert_equal would fail without this method
    other.is_a?(Car) && name == other.name
  end
end
```

### [Assignment write a test suite for Todo List](https://launchschool.com/lessons/dd2ae827/assignments/cf0f8d58)
[my test suite for todo list](https://github.com/SandyRodger/RB130-139/blob/main/01_course_exercises/02_lesson_2_introduction_to_testing/02_assertions/12_todolist_test.rb)

Interesting point about squiggly heredocs.

### [Code coverage](https://launchschool.com/lessons/dd2ae827/assignments/9f7c1f7c)

- How much of the program is actually tested by the test suite?
- Code coverage is one way of meansuring code quality.
- THere are many tools for testing code coverage. We will use `simplecov`.

```ruby
gem install simplecov
```
then this at the top of your test file:
```ruby
require 'simplecov'
SimpleCov.start
```
and next time you run your tests you will see an html file has been created, which when opened shows you how much of your code is covered by tests.

### [Exercises More topics](https://launchschool.com/lessons/dd2ae827/assignments/f4633861)

- [Easy 1](https://github.com/SandyRodger/RB130-139/tree/main/02_exercises/01_easy_1)
- [Easy 2](https://github.com/SandyRodger/RB130-139/tree/main/02_exercises/02_easy_2)
- [Easy testing](https://github.com/SandyRodger/RB130-139/tree/main/02_exercises/03_easy_testing)
- [Medium 1](https://github.com/SandyRodger/RB130-139/tree/main/02_exercises/04_medium_1)
- [Medium 2 testing](https://github.com/SandyRodger/RB130-139/tree/main/02_exercises/05_medium_2_testing)

### [proc to block operator](https://launchschool.com/exercises/ecdb2b22)

- is `&`
- When used with a method argument Ruby tries to convert that object to a block:

```ruby
comparator = proc { |a, b| b <=> a }
array.sort(&comparator)
```

- When the object is not a proc (can only be a symbol?), `&` attempts to call `#to_proc` on the object first.
- **Symbol to Proc operation**: Used with symbols representing methods (`&:to_i`) Ruby creates a proc that calls that method (here `to_i`) on a passed object and then converts that proc to a block. (A more accutrate name would be 'symbol to proc to block operator')
- Remember that the above describes `&` applied to an argument object. This is different to how it is applied to a method parameter:
```ruby
def foo(&block)
  block.call
end
```
  ... here it has the reverse effect, converting the method parameter to a proc object.
  
```ruby
 # 1
def convert_block_to_proc(&arg_1)
  arg_1.call(1)     # arg_1 has been turned into a proc.
end

convert_block_to_proc{|a| puts a}

# => 1

# 2
my_proc = proc { |a| "this is #{a}" }

def convert_proc_to_block
	[1, 2, 3].each{|n| puts yield(n)}
end

convert_proc_to_block(&my_proc) # Without the & this raises an Argument Error, because & converts a proc into a block and we can't yield to a proc

# => this is 1
# => this is 2
# => this is 3

convert_proc_to_block(&:to_s)   # This is calling Method#to_proc

# => 1
# => 2
# => 3
```
### [Capturing input and output](https://launchschool.com/exercises/64799839)

- [Exercise about capturing input](https://launchschool.com/exercises/64799839)
- [Exercise about capturing output](https://launchschool.com/exercises/e2b66911)

Something about `String:IO`. **I have to come back to this with more brain power**.

### [blocks, procs and lambdas](https://launchschool.com/exercises/753d0323)

