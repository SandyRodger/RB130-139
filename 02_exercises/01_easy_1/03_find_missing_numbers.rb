# https://launchschool.com/exercises/a0a4a3d4

def missing(sorted_arr)
	output = []
	return output if sorted_arr.size <= 1
	range = (sorted_arr[0]..sorted_arr[-1]).to_a
	range.each_with_object(output) do |num1, output|
		output << num1 unless sorted_arr.include?(num1)
	end
end

# LS solution:
def missing(array)
  result = []
  array.each_cons(2) do |first, second|
    result.concat(((first + 1)..(second - 1)).to_a)
  end
  result
end

p missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
p missing([1, 2, 3, 4]) == []
p missing([1, 5]) == [2, 3, 4]
p missing([6]) == []
