# https://launchschool.com/lessons/c0400a9c/assignments/f7185b37

class Todo
  DONE_MARKER = 'X'
  UNDONE_MARKER = ' '

  attr_accessor :title, :description, :done

  def initialize(title, description='')
    @title = title
    @description = description
    @done = false
  end

  def done!
    self.done = true
  end

  def done?
    done
  end

  def undone!
    self.done = false
  end

  def to_s
    "[#{done? ? DONE_MARKER : UNDONE_MARKER}] #{title}"
  end

  def ==(otherTodo)
    title == otherTodo.title &&
      description == otherTodo.description &&
      done == otherTodo.done
  end

end

class TodoList
  attr_accessor :title

  def initialize(title)
    @title = title
    @todos = []
  end

	def add(object)
		raise TypeError "Can only add Todo objects" unless object.is_a?(Todo)
		@todos.push(object)
	end

	alias_method :<<, :add

	def size
		@todos.size
	end

	def first
		@todos.first
	end

	def last
		@todos[-1]
	end

	def to_a
		@todos.to_a
	end	

	def done?
		@todos.all? {|item| item.done?}
	end

	def item_at(idx)
		raise IndexError if idx >= @todos.size
		@todos[idx]
	end

	def mark_done_at(idx)
		raise IndexError if idx >= @todos.size
		@todos[idx].done!
	end

	def mark_undone_at(idx)
		raise IndexError if idx >= @todos.size
		@todos[idx].undone!
	end

	def done!
		@todos.each{|item| item.done!}
	end

	def undone!
		@todos.each{|item| item.undone!}
	end

	def shift
		@todos.shift
	end

	def pop
		@todos.pop
	end

	def remove_at(idx)
		raise IndexError if idx >= @todos.size
		@todos.delete_at(idx)
	end

	def to_s
		puts 		"---- Today's Todos ----"
		@todos.each do |item|
		puts item.to_s
		end
	end

	def each
		counter = 0
		size.times do |item|
			yield(todos_clone[counter])
			counter += 1
		end
		self
	end

	def select
		@todos.each_with_object(TodoList.new(title)) do |todo, output|
			output.add(todo) if yield(todo)
		end
	end
	
	def find_by_title(title)
		@todos.each do |todo|
			return todo if todo.title == title
		end
		nil
	end

	def all_done
		select {|item| item.done?}
	end

	def all_not_done
		select {|item| !item.done?}
	end

	def mark_done(title)
		@todos.each do |todo|
			if todo.title == title
				todo.done!
				return todo
			end
		end
	end

	def mark_all_done
		done!
	end

	def mark_all_undone
		undone!
	end

end

todo1 = Todo.new("Buy milk")
todo2 = Todo.new("Clean room")
todo3 = Todo.new("Go to gym")

list = TodoList.new("Today's Todos")
list.add(todo1)
list.add(todo2)
list.add(todo3)

todo1.done!

