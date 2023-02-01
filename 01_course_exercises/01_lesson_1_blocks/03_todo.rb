# https://launchschool.com/lessons/c0400a9c/assignments/b2926256

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
end


todo1 = Todo.new("Buy milk")
todo2 = Todo.new("Clean room")
todo3 = Todo.new("Go to gym")
list = TodoList.new("Today's Todos")

list.add(todo1)                 # adds todo1 to end of list, returns list
list.add(todo2)                 # adds todo2 to end of list, returns list
list << todo3                 # adds todo3 to end of list, returns list
#list.add(1)                     # raises TypeError with message "Can only add Todo objects"
list.size                       # returns 3
list.first                      # returns todo1, which is the first item in the list
list.last                       # returns todo3, which is the last item in the list
list.to_a                      # returns an array of all items in the list
list.done?                     # returns true if all todos in the list are done, otherwise false
#list.item_at                    # raises ArgumentError
list.item_at(1)                 # returns 2nd item in list (zero based index)
# list.item_at(100)               # raises IndexError
#list.mark_done_at               # raises ArgumentError
list.mark_done_at(1)            # marks the 2nd item as done
# list.mark_done_at(100)          # raises IndexError
#list.mark_undone_at             # raises ArgumentError
list.mark_undone_at(1)          # marks the 2nd item as not done,
#list.mark_undone_at(100)        # raises IndexError
list.done!                      # marks all items as done
#list.shift                      # removes and returns the first item in list
#list.pop                        # removes and returns the last item in list
# remove_at
#list.remove_at                  # raises ArgumentError
list.remove_at(1)               # removes and returns the 2nd item
#list.remove_at(100)             # raises IndexError
todo4 = Todo.new("catch tiger")
list.add(todo4)
list.to_s                      # returns string representation of the list