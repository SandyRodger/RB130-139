def dinosaurs
	idx = -1
	dinos = ["Stegosaurus", "Apatosaurus", "Brachiosaurus", "Diplodocus", "triceratops"]

	Proc.new do 
		idx += 1
		idx = -1 if idx > 4
		"#{dinos[idx]} at index #{idx}"
	end
end

dinos1 = dinosaurs 
p dinos1 # => #<Proc:0x00007fac578a57b8@01_multiple_closures_from_a_proc.rb:5>

p dinos1.call # => "Stegosaurus at index 0"
p dinos1.call # => "Apatosaurus at index 1"

dinos2 = dinosaurs

p dinos2.call # => "Stegosaurus at index 0"
p dinos1.call # => "Brachiosaurus at index 2"