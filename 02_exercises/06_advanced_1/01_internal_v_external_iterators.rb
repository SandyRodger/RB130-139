# https://launchschool.com/exercises/0b6294cb

# factorial = Enumerator.new do |array|
#   array << 1
#   num = 1
#   loop do
#     multiples = (1..num).to_a
#     array << multiples.reduce(:*)
#     num += 1
#   end
# end

# p factorial.take(7) # => [1, 1, 2, 6, 24, 120, 720]
# p factorial.take(10) # => [1, 1, 2, 6, 24, 120, 720, 5040, 40320, 362880]
# p factorial.rewind

# factorial.each_with_object("an object") do |num, obj|
#   puts "#{obj}: #{num}"
#   break if num > 100
# end

# p factorial.next # => 1
# p factorial.next # => 1
# p factorial.next # => 2
# p factorial.next # => 6
# p factorial.next # => 120
# p factorial.next # => 720
# p factorial.next # => 540
# p factorial.next # => 40320
# p factorial.next # => 362880
# factorial.rewind
# p factorial.next # => 1

# LS SOLUTION:

# factorial = Enumerator.new do |yielder|
#   accumulator = 1
#   number = 0
#   loop do
#     accumulator = number.zero? ? 1 : accumulator * number
#     yielder << accumulator
#     number += 1
#   end
# end

# # # External iterators

# 6.times { |number| puts "#{number}! == #{factorial.next}" }
# puts "=========================="
# 6.times { |number| puts "#{number}! == #{factorial.next}" }
# puts "=========================="
# factorial.rewind
# 6.times { |number| puts "#{number}! == #{factorial.next}" }
# puts "=========================="

# # Internal iterators

# factorial.each_with_index do |value, number|
#   puts "#{number}! == #{value}"
#   break if number >= 5
# end