# https://launchschool.com/exercises/ecdb2b22 

def convert_to_octal(num)
	output = ""
	loop do
		output.prepend((num % 8).to_s)
		return output.to_i if num/8 == 0
		num /= 8
	end
end

def convert_to_base_8(n)
  n.to_s(8).to_i
end

base8_proc = method(:convert_to_base_8).to_proc
p [8, 10, 12, 14, 16, 33].map(&base8_proc)

# I figured it out!

# Same as LS solution