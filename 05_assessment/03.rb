=begin

Question 3 
4 Points

Describe what's happening in the code below. Why does line 8 output goodbye?

=end

greeting = "Hello"

def change_greeting(greeting)
  yield greeting
end

change_greeting(greeting) { greeting = "Goodbye" }
p greeting # "Goodbye"

=begin

Your Answer

In line 1 we assign "Hello" to the local variable greeting. In lines 3 to 5 we define the change_greeting method. In line 7 we call the change_greeting method passing in greeting and an implicit block as arguments. Within the block we reassign greeting to "Goodbye". This is because the block in line 7 is a closure and it retains a reference to the first greeting variable as part of its binding. This is why it is able to reassign greeting to "Goodbye" from within the block, even though it is executed within a method, where it otherwise would not have access to a variable that had not been passed in. In line 8 we pass the new value of greeting to the p method which prints "Goodbye"

=end