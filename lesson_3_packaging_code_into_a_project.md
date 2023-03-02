## [Packaging Code into a Project](https://launchschool.com/lessons/2fdb1ef0/assignments)
### [The Ruby Toolbox](https://launchschool.com/lessons/2fdb1ef0/assignments/c8dcc861)
   This lesson is about some of the main tools a dev needs outside of coding:
   - Ruby gems
   - RVM and Rbenv
   - Bundler
   - Rake

[then read the Core Ruby Tools book](https://github.com/SandyRodger/launch_school_books/blob/main/ruby_core_tools.md)

### [Setting Up The Project Directory](https://launchschool.com/lessons/2fdb1ef0/assignments/1752fa44)

### [Preparing a Ruby gem](https://launchschool.com/lessons/2fdb1ef0/assignments/918536a2)

- In order for your project to make use of RubyGems you must:
  - Use a common directory structure.
  - supply a `gemspec` file.
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

