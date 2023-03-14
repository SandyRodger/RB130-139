def hi_my_name_is(what)
	what.call
end
i_yam = "Sandy"
i_say = Proc.new { puts "Hey there, I happen to be called #{i_yam}"}
i_yam = "Geoff"

hi_my_name_is(i_say) # => Hey there, I happen to be called Geoff