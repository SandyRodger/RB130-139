# [Introduction to Testing](https://launchschool.com/lessons/dd2ae827/assignments)

Contents:

- [Introduction](#introduction)
- [Setting up Minitest](#setting-up-minitest)
- [Lecture: Minitest](#lecture-minitest)

### [Introduction](https://launchschool.com/lessons/dd2ae827/assignments/554f5ac5)

Why do we write tests? To prevent regression. (This is the beginners answer, sufficient for now)

- Testing can become very complicated when considered in the context of work-flows, frameworks and different tools. So this is a simplified lesson on testing, which can be called 'unit-testing'.
- The Ruby default testing library is 'Minitest', which this lesson will use.
- There is a lot of testing jargon, it will be ignored in this lesson. Later we can build more complex methodologies and tools upon this foundation.

### [Setting up Minitest](https://launchschool.com/lessons/dd2ae827/assignments/6bf3c66c)

```ruby
gem install minitest # => installs Minitest

gem list minitest # => lists which version of Minitest you have installed

# then create a file in which to write your tests

# in temp.rb
require 'minitest/autorun'

class MyFirstTest < Minitest::Test
  def test_first_test
    assert true
  end
end

# and run it from the command line like so:

$ ruby temp.rb
Run options: --seed 30741

# Running:

MyFirstTest .

Finished in 0.001034s, 967.2303 runs/s, 967.2303 assertions/s.

1 runs, 1 assertions, 0 failures, 0 errors, 0 skips


```

### [Lecture Minitest](https://launchschool.com/lessons/dd2ae827/assignments/3a8a5aa5)
