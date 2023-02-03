# https://launchschool.com/exercises/ec8dd514

def step(start, finish, step)
	output = []
	loop do
		yield(start)
		output << start
		start += step
		return output if start > finish
	end
end

p step(1, 10, 3) { |value| puts "value = #{value}" }
# => value = 1
# => value = 4
# => value = 7
# => value = 10
p step(3, 40, 8) { |value| puts "." * value}