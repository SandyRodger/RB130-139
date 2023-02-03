# https://launchschool.com/exercises/944b8310

def any?(array)
	array.each_with_object(false) {|n| return true if yield(n)}
end

p any?([1, 3, 5, 6]) { |value| value.even? } == true
p any?([1, 3, 5, 7]) { |value| value.even? } == false
p any?([2, 4, 6, 8]) { |value| value.odd? } == false
p any?([1, 3, 5, 7]) { |value| value % 5 == 0 } == true
p any?([1, 3, 5, 7]) { |value| true } == true
p any?([1, 3, 5, 7]) { |value| false } == false
p any?([]) { |value| true } == false
p any?({A: 1, B: 2, C: 3}) {|k,v| v.instance_of? Integer} == true
p any?({A: 1, B: 2, C: 3}) {|k,v| v.instance_of? String} == false