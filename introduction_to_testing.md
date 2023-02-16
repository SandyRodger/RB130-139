# [Introduction to Testing](https://launchschool.com/lessons/dd2ae827/assignments)

Contents:

- [Introduction](#introduction)
- [Setting up Minitest](#setting-up-minitest)
- [Lecture: Minitest](#lecture-minitest)
- [How to make a test](#how-to-make-a-test)
- [Expectation syntax](#expectation-syntax)
- [Summary](#summary)
- [Assertions](#assertions)

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

### [Summary](https://launchschool.com/lessons/dd2ae827/assignments/3a8a5aa5)

- Minitest is a library of tests that comes installed with Ruby.
- Using Minitests is very easy and you can play around with it.
- Create a test file
- Create a test class inheriting from `MiniTest::Test`
- Create tests that start with `test_`
- Create assertions with `assert_equal` comparing expected value and actual value.
- Colorize Minitest with `minitest-reporters.
- `skip` tests.
- Assertion-style v. expectation style.

### [Assertions](https://launchschool.com/lessons/dd2ae827/assignments/fe2ff54a)

