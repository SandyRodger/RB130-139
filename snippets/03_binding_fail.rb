def hi_my_name_is(what)
	what.call
end

i_say = Proc.new { puts "Hey there, I happen to be called #{i_yam}"}
i_yam = "Sandy"

hi_my_name_is(i_say) # => undefined local variable or method `i_yam' for main:Object (NameError)