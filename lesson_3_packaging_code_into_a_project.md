## [Packaging Code into a Project](https://launchschool.com/lessons/2fdb1ef0/assignments)
### [The Ruby Toolbox](https://launchschool.com/lessons/2fdb1ef0/assignments/c8dcc861)
   This lesson is about some of the main tools a dev needs outside of coding:
   - Ruby gems
   - RVM and Rbenv
   - Bundler
   - Rake

[then read the Core Ruby Tools book](https://github.com/SandyRodger/launch_school_books/blob/main/ruby_core_tools.md)

### [Setting Up The Project Directory](https://launchschool.com/lessons/2fdb1ef0/assignments/1752fa44)

- devs expect to find the program in a `lib` directory and tests in a `test` directory

### [Setting Up The Gemfile](https://launchschool.com/lessons/2fdb1ef0/assignments/61b773fd)

- Now we configure Bundler
- - Write `require 'bundler/setup'` in each file.
  - Gemfile and Gemfile.lock are used by Bundler to provide information about the gems your project uses.
- Set your local ruby to match the ruby in the Gemfile : `rbenv local 3.1.0 ` or `rvm use 3.1.0 ` for rvm
- If you don't have the required ruby, you can install it like this:

```
$ rbenv install 3.1.0
$ rbenv local 3.1.0
$ gem install bundler
```

- We add this to our project files : `require 'bundler/setup'` , which I haven't seen in the Sinatra material. Does that mean Sinatra includes this function?

### [Adding Another Gem](https://launchschool.com/lessons/2fdb1ef0/assignments/b65b5aba)

- (Review 4.2.24)
   - Add a due date attribute.
   - Add 2 tests to test this.
   - Formatting (the `to_s` overwrite)
   - `stamp` gem to format times in an easy way. (Was this instruction added after? I have no memory of stamp)

### [Setting Up The Rakefile](https://launchschool.com/lessons/2fdb1ef0/assignments/f0ffb4db)

- Start like this:

```
desc 'Say hello'
task :hello do
  puts "Hello there. This is the 'hello' task."
end
```

- `bundle exec rake -T`
   - The `-T` flag means it only prints the command names, rather than actually running them.
- Then `bundle exec rake hello` - which runs the command.
   - At this point `Bundle exec rake` won't work, because that command assumes a `:default` command, which we haven't yet written.
- Add a task to run the tests.
- Default tasks:

```
desc 'Run tests'
task :default => :test
```

- We have been using the `sh` command (for 'shell') to run commands from the terminal. This isn't ideal, so now we will use `rake/testtask`:

```
require "rake/testtask"

desc 'Say hello'
task :hello do
  puts "Hello there. This is the 'hello' task."
end

desc 'Run tests'
task :default => :test

Rake::TestTask.new(:test) do |t|
  t.libs << "test"
  t.libs << "lib"
  t.test_files = FileList['test/**/*_test.rb']
end
```

- Complicated exercise sabout printing directory contents:
   - My solution

```ruby
desc 'list project files'
task :list_project_files do
  Find.find(ENV["PWD"]) do |path|
    if FileTest.directory?(path)
      if File.basename(path).start_with?('.')
        Find.prune
      else
        next
      end
    else
      puts path unless File.basename(path).start_with?('.')
    end
  end
end
```

   - LS solution:

```ruby
desc 'Display inventory of all files'
task :inventory do
  Find.find('.') do |name|
    next if name.include?('/.') # Excludes files and directories with . names
    puts name if File.file?(name)
  end
end
```

- remember Rake files are just for automating common tasks. They don't have to be used and when used they don't have to be used with bundler or tests or any of the things they are commonly used for/with.

### [Preparing a Ruby gem](https://launchschool.com/lessons/2fdb1ef0/assignments/918536a2)

#### Gemspec
 
 - This section is about how to prepare your project for public consumption.
    - The `.gemspec` file and the `bundler/gem_tasks` require file add layers of prep and then send it to Rubygems.com.

- In order for your project to make use of RubyGems you must:
  - Use a common directory structure.
  - supply a `.gemspec` file.
  - Most projects also have a Gemfile and a Rake file, but it's not mandatory.

- When you're ready to distribute your project you should:
  -  read the documentation
  -  prepare any additional directories
  -  prepare a `README.md` file.
  -  Write documentation if necessary.
  -  prepare your gemspec file.
  -  add a gemspec statement to your gemspec file.
  -  modify your rakefile to include standard rubygem tasks.

Here is an example of a simple gemspec file called `todolist_project.gemspec`:

```ruby
Gem::Specification.new do |s|
  s.name        = 'todolist_project'
  s.version     = '1.0.0'
  s.summary     = 'Todo List Manager!'
  s.description = 'This is a simple todo list manager!'
  s.authors     = ['Pete Williams']
  s.email       = 'pw@example.com'
  s.homepage    = 'http://example.com/todolist_project'
  s.files       = ['lib/todolist_project.rb', 'test/todolist_project_test.rb']
end
```

- Adding `'require bundler/gem_tasks'` to your rake file includes several tasks to your rake file. They are:
  - `rake build`
  - `rake install`
  - `rake release`
  - and some more you needn't worry about.

## [Lesson 3 summary](https://launchschool.com/lessons/2fdb1ef0/assignments/8baba62e)

- Ruby gems is a library of tools you can integrate into your projects with the `gem` command.
- Ruby gems also allows you to create and package your own gems. These can be either pacakges you require into other projects (like colorize) or just projects in their own right (like bundler - and maybe in the future CalCou?)
- Ruby projects usually use gems and the format it requires.
- RVMs help you manage multiple gems and versions.
- Bundler gives you the tools to include info about your programs dependencies and install those programs
- if you want to release a project or library on gems you have to include a '.gemspec' file.
- Any problems - look at the core ruby tools book.

### [Quiz](https://launchschool.com/quizzes/d8afd81f)

|           | 1st attempt | 2nd attempt (28th March '22) | 3rd attempt (4.2.24)|
| :---: | :---: | :---: | :---: |
|1.        |       1     |       c,e (nope - b)      | B (tick)|
|2.        |       1     |       b, d (nope - just d) |D (tick)|
|3.        |       1     |       c,e   (tick)   |C, E (tick)|
|4.        |       1     |         a  (tick)    |A (tick)|
|5.        |       1     |         d. (tick)    |D (tick)|
|6.        |       1     |         a.  (tick)   |A (tick)|
|7.        |       1     |          c   (tick)  |C (tick)|
|8.        |       1     |           d (tick) | D (tick)|
|9.        |       1     |        b, d  (tick)   |B, C, D (Not C) Actually - `Gemfile` and `Gemfile.lock` are both used in both.|
|10.       |       1     |         b  (tick)  | B (tick)|
|11.       |       1     |          c (tick)  | C (tick)|
| total:    |      100%   |         82%         | 91% |

Errors:

- Question 1: Bundler lets you manage the various dependencies in a Ruby project (not rbenv and RVM)
- Question 2: Rake automates common tasks required to build, test, package, and install programs. (not Bundler)
 
