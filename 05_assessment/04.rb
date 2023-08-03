=begin

Question 4 
2 Points 

Describe what's happening in the code below. Why do lines 4 and 7 have different outputs? What important characteristic of bindings does this snippet demonstrate?

=end

name = "Sparky"

proc_obj = Proc.new { puts "Hi, I'm #{name}" }
proc_obj.call # => Hi, I'm Sparky

name = "Fido"
proc_obj.call # => Hi, I'm Fido

=begin

Here is demonstrated the fact that bindings retain a memory of the artifacts in scope at its creation. This means that when objects in saved as part of a closure's binding are invoked they will have an up to date reference of the value attached to the object. So in line 3 we create a closure with Proc.new { puts "Hi, I'm #{name}" }. This closure saves as part of its binding a reference to name. In line 4 name still refers to "Sparky", but in line 6 name is reassigned to "Fido". So when the proc_obj is called with Proc#call on line 7 and name is referenced it returns the updated value.

=end