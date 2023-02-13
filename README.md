# RB130-139 Ruby Foundations: More Topics
## Table of Contents
- [Study guide](#study-guide)
- [Coursework](#coursework)
- [Exercises](#exercises)
- [Extra resources](#extra-resources)
## Study Guide
- [Blocks](https://github.com/SandyRodger/RB130-139/blob/main/Blocks)
  - Closures
  - Variable Scope and Binding
  - What are blocks?
  - Writing methods that take blocks
    - Passing Execution to a Block
    - Yielding with an Argument
    - Return Value of a Block
  - Use Cases for Blocks
    - Deferring Implementation
    - Sandwich Code
  - Explicit Block Parameters
  - Symbol to Proc
  - Arity
  - Blocks vs Procs vs Lambdas
- Testing Terms
  - Assertion
  - Code Coverage
  - DSL (Domain Specific Language)
  - Equivalence
  - Minitest
  - Refutations
  - Regression
  - SEAT Approach
  - simplecov
  - Skip
  - Test
  - Test Suite
  - Unit Testing
- Core Ruby Tools
  - Overview
  - Installing Ruby
  - Ruby Version Managers
  - Gems
    - What are Gems?
    - Working with Gems
  - Bundler
    - Gemfile and Gemfile.lock
    - Using Bundler
    - bundle exec
  - Rake
- Packaging Code Into a Project
  - Project Directory
  - Gemfile Setup
  - Adding More
  - Rakefile Setup
  - gemspec
- Regex Cheat Sheet
- Open Ended Practice Questions
## Coursework
### Lesson 1: Blocks
- [Select](https://github.com/SandyRodger/RB130-139/blob/main/01_course_exercises/01_lesson_1_blocks/01_select.rb)
- [Reduce](https://github.com/SandyRodger/RB130-139/blob/main/01_course_exercises/01_lesson_1_blocks/02_reduce.rb)
- [todo](https://github.com/SandyRodger/RB130-139/blob/main/01_course_exercises/01_lesson_1_blocks/03_todo.rb)
- [todo each](https://github.com/SandyRodger/RB130-139/blob/main/01_course_exercises/01_lesson_1_blocks/04_todo_each.rb)
- [todo select](https://github.com/SandyRodger/RB130-139/blob/main/01_course_exercises/01_lesson_1_blocks/05_todo_select.rb)
- [todo select 2](https://github.com/SandyRodger/RB130-139/blob/main/01_course_exercises/01_lesson_1_blocks/06_todo_select_2.rb)
- [todo each 2](https://github.com/SandyRodger/RB130-139/blob/main/01_course_exercises/01_lesson_1_blocks/07_todo_each_2.rb)
- [more todo methods](https://github.com/SandyRodger/RB130-139/blob/main/01_course_exercises/01_lesson_1_blocks/08_more_todo_methods.rb)
- [LS todo list](https://github.com/SandyRodger/RB130-139/blob/main/01_course_exercises/01_lesson_1_blocks/09_ls_todo_list.rb)
### Lesson 2: Testing
- [MiniTest](https://github.com/SandyRodger/RB130-139/tree/main/01_course_exercises/02_lesson_2_introduction_to_testing/01_minitest)
- [Assertions](https://github.com/SandyRodger/RB130-139/tree/main/01_course_exercises/02_lesson_2_introduction_to_testing/02_assertions)
- [Code coverage](https://github.com/SandyRodger/RB130-139/tree/main/01_course_exercises/02_lesson_2_introduction_to_testing/03_code_coverage)
## Exercises
### Easy 1
- [Enumerable class creation](https://github.com/SandyRodger/RB130-139/blob/main/02_exercises/01_easy_1/01_enumerable_class_creation.rb)
- [Optional blocks](https://github.com/SandyRodger/RB130-139/blob/main/02_exercises/01_easy_1/02_optional_blocks.rb)
- [Find missing numbers](https://github.com/SandyRodger/RB130-139/blob/main/02_exercises/01_easy_1/03_find_missing_numbers.rb)
- [Divisors](https://github.com/SandyRodger/RB130-139/blob/main/02_exercises/01_easy_1/04_divisors.rb)
- [Encrypted Pioneers](https://github.com/SandyRodger/RB130-139/blob/main/02_exercises/01_easy_1/05_encrypted_pioneers.rb)
- [Iterators: true for any?](https://github.com/SandyRodger/RB130-139/blob/main/02_exercises/01_easy_1/06_iterators_true_for_any.rb)
- [Iterators: true for all?](https://github.com/SandyRodger/RB130-139/blob/main/02_exercises/01_easy_1/07_true_for_all.rb)
- [Iterators: true for none?](https://github.com/SandyRodger/RB130-139/blob/main/02_exercises/01_easy_1/08_true_for_none.rb)
- [Iterators: true for one?](https://github.com/SandyRodger/RB130-139/blob/main/02_exercises/01_easy_1/09_true_for_one.rb)
- [Count Items](https://github.com/SandyRodger/RB130-139/blob/main/02_exercises/01_easy_1/10_count_items.rb)
### Easy 2
- [From-To-Step Sequence Generator](01_from_to_step_sequence_generator.rb)
- [Zipper](https://github.com/SandyRodger/RB130-139/blob/main/02_exercises/02_easy_2/02_zipper.rb)
- [map](https://github.com/SandyRodger/RB130-139/blob/main/02_exercises/02_easy_2/03_map.rb)
- [count](https://github.com/SandyRodger/RB130-139/blob/main/02_exercises/02_easy_2/04_count.rb)
- [drop_while](https://github.com/SandyRodger/RB130-139/blob/main/02_exercises/02_easy_2/05_drop_while.rb)
- [each_with_index](https://github.com/SandyRodger/RB130-139/blob/main/02_exercises/02_easy_2/06_each_with_index.rb)
- [each_with_object](https://github.com/SandyRodger/RB130-139/blob/main/02_exercises/02_easy_2/07_each_with_object.rb)
- [max_by](https://github.com/SandyRodger/RB130-139/blob/main/02_exercises/02_easy_2/08_max_by.rb)
- [each_cons (Part 1)](09_each_cons_part_1.rb)
- [each_cons (Part 2)](https://github.com/SandyRodger/RB130-139/blob/main/02_exercises/02_easy_2/10_each_cons_part_2.rb)
### Easy Testing
- [Boolean Assertions](https://github.com/SandyRodger/RB130-139/blob/main/02_exercises/03_easy_testing/01_boolean_assertions.rb)
- [Equality Assertions](https://github.com/SandyRodger/RB130-139/blob/main/02_exercises/03_easy_testing/02_equality_assertions.rb)
- [Nil Assertions](https://github.com/SandyRodger/RB130-139/blob/main/02_exercises/03_easy_testing/03_nil_assertions.rb)
- [Empty Object Assertions](https://github.com/SandyRodger/RB130-139/blob/main/02_exercises/03_easy_testing/04_empty_object_assertions.rb)
- [Included Object Assertions](https://github.com/SandyRodger/RB130-139/blob/main/02_exercises/03_easy_testing/05_included_object_assertions.rb)
- [Exception Assertions](https://github.com/SandyRodger/RB130-139/blob/main/02_exercises/03_easy_testing/06_exception_assertions.rb)
- [Type Assertions](https://github.com/SandyRodger/RB130-139/blob/main/02_exercises/03_easy_testing/07_type_assertions.rb)
- [Kind Assertions](https://github.com/SandyRodger/RB130-139/blob/main/02_exercises/03_easy_testing/08_kind_assertions.rb)
- [Same Object Assertions](https://github.com/SandyRodger/RB130-139/blob/main/02_exercises/03_easy_testing/09_same_object_assertions.rb)
- [Refutations](https://github.com/SandyRodger/RB130-139/blob/main/02_exercises/03_easy_testing/10_refutations.rb)
### Medium 1
- [Listening Device](https://github.com/SandyRodger/RB130-139/blob/main/02_exercises/04_medium_1/01_listening_device.rb)
- [Text Analyzer - Sandwich Code](https://github.com/SandyRodger/RB130-139/blob/main/02_exercises/04_medium_1/02_text_analyzer_sandwich_code.rb)
- [Passing Parameters Part 1](https://github.com/SandyRodger/RB130-139/blob/main/02_exercises/04_medium_1/03_passing_params_pt_1.rb)
- [Passing Parameters Part 2](https://github.com/SandyRodger/RB130-139/blob/main/02_exercises/04_medium_1/04_passing_params_pt_2.rb)
- [Passing Parameters Part 3](https://github.com/SandyRodger/RB130-139/blob/main/02_exercises/04_medium_1/05_passing_params_pt_3.rb)
- [Method to Proc](https://github.com/SandyRodger/RB130-139/blob/main/02_exercises/04_medium_1/06_method_to_proc.rb)
- Bubble Sort with Blocks
### Medium 2: Testing
- Cash Register Class
- Transaction Class
- Cash Register Tests
- Transaction Tests
- Text Class
- Text Tests
### Advanced 1
- Internal vs External Iterators
- Procs, Lambdas, and Blocks: Definition and Arity
### Regex Book
- Ruby Methods with Regex
## Extra Resources
- [Ginni's notes](https://github.com/gcpinckert/rb130_139)
