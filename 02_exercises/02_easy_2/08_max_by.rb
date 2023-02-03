# https://launchschool.com/exercises/35a94033

require 'byebug'

def max_by(arr)
	return nil if arr.empty?

	highest_val = 0
	highest_obj = nil

	new_arr = arr.map {|elem| yield(elem)}
	new_arr.map!(&:ord) if new_arr[0].is_a? String
	new_arr.map!{|n| n + 100000 } if new_arr[0] < 0
	
	new_arr.each_with_index do |n, idx|
		if n > highest_val
			highest_val = n
			highest_obj = arr[idx]
		end
	end

	highest_obj
end

# LS solution:

def max_by(array)
  return nil if array.empty?

  max_element = array.first
  largest = yield(max_element)

  array[1..-1].each do |item|
    yielded_value = yield(item)
    if largest < yielded_value
      largest = yielded_value
      max_element = item
    end
  end

  max_element
end

p max_by([1, 5, 3]) { |value| value + 2 } == 5
p max_by([1, 5, 3]) { |value| 9 - value } == 1
p max_by([1, 5, 3]) { |value| (96 - value).chr } == 1
p max_by([[1, 2], [3, 4, 5], [6]]) { |value| value.size } == [3, 4, 5]
p max_by([-7]) { |value| value * 3 } == -7
p max_by([]) { |value| value + 5 } == nil