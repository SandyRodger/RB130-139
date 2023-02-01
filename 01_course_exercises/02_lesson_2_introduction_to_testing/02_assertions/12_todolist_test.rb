require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!
require 'byebug'
require_relative 'todolist'

class TodoListTest < MiniTest::Test

  def setup
    @todo1 = Todo.new("Buy milk")
    @todo2 = Todo.new("Clean room")
    @todo3 = Todo.new("Go to gym")
    @todos = [@todo1, @todo2, @todo3]

    @list = TodoList.new("Today's Todos")
    @list.add(@todo1)
    @list.add(@todo2)
    @list.add(@todo3)
  end

  def test_to_a
		assert_equal(@todos, @list.to_a)
	end

	def test_size
		assert_equal(3, @list.size)
	end

	def test_first
		assert_equal(@todo1, @list.first)
	end

	def test_last
		assert_equal(@todo3, @list.last)
	end

	def test_shift
		todo = @list.shift
		assert_equal(@todo1, todo)
		assert_equal([@todo2, @todo3], @list.to_a)
	end

	def test_pop
		todo = @list.pop
		assert_equal(@todo3, todo)
		assert_equal([@todo1, @todo2], @list.to_a)
	end

	def test_done?
		assert_equal(false, @list.done?)
	end

	def test_index_error
		assert_raises(TypeError){@list.add(1)}
	end

	def test_add
		todo4 = Todo.new("buy socks")
		added_list = [@list.todos, todo4].flatten 
		assert_equal(added_list, @list.add(todo4))
	end

	def test_add_equals_shovel
		todo4 = Todo.new("buy socks")
		added_list = @list.add(todo4)
		shovelled_list = @list << todo4
		assert_equal(added_list, shovelled_list)
	end

	def test_item_at
		assert_equal(@list.todos[0], @todo1)
		assert_raises(IndexError){@list.item_at((@list.size))}
	end

	def test_mark_done_at
		assert_equal(@list.mark_done_at(0), @list.item_at(0).done)
		assert_raises(IndexError){@list.mark_done_at((@list.size))}
	end

	def test_mark_undone_at
		assert_raises(IndexError) { @list.mark_undone_at(100) }
		@list.mark_done_at(0)
		@list.mark_done_at(1)
		@list.mark_done_at(2)
		@list.mark_undone_at(1)
		assert_equal(true, @todo1.done?)
		assert_equal(false, @todo2.done?)
		assert_equal(true, @todo3.done?)
	end

	def test_done!
		@list.done!
		assert_equal(true, @list.todos.all?(&:done?))
	end

	def test_remove_at
		assert_raises(IndexError) { @list.remove_at(100) }
		assert_equal(@list.remove_at(1), @todo2)
	end

	def test_to_s
		output = <<~OUTPUT.chomp
		---- Today's Todos ----
		[ ] Buy milk
		[ ] Clean room
		[ ] Go to gym
		OUTPUT
	
		assert_equal(output, @list.to_s)
	end

	def test_to_s_2
		output = <<-OUTPUT.chomp.gsub /^\s+/, ""
		---- Today's Todos ----
		[ ] Buy milk
		[X] Clean room
		[ ] Go to gym
		OUTPUT
	
		@list.mark_done_at(1)
		assert_equal(output, @list.to_s)
	end

	def test_to_s_3
		output = <<-OUTPUT.chomp.gsub /^\s+/, ""
		---- Today's Todos ----
		[X] Buy milk
		[X] Clean room
		[X] Go to gym
		OUTPUT
	
		@list.done!
		assert_equal(output, @list.to_s)
	end

	def test_each
		test_arr = []
		@list.each {|item| test_arr << item.is_a?(Todo)}
		assert_equal(test_arr.all?(true), true)
	end

	def test_each_2
		assert_equal(@list,@list.each {|n|n})
	end

	def test_select
		list1 = @list.select{|item|item.is_a?(Todo)}
		assert_equal(list1.todos, @list.todos)
		assert_equal(list1.title, @list.title)
	end
end