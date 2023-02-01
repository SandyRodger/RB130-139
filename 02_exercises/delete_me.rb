arr = [1, 2, 3, 4, 5]
p arr.reduce(:+) == 15
p arr.reduce{|sum, n| sum + n} == 15
p arr.reduce(:*) == 120
p arr.reduce(1, :*) == 120
p arr.reduce(1) {|product, n| product * n} == 120
p arr.reduce(2, :*) == 240
p arr.reduce(2) {|product, n| product * n} == 240
longest = %w{ cat sheep bear }.reduce do |memo, word|
	memo.length > word.length ? memo : word
end
p longest == "sheep"
