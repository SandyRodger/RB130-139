array = [1, 2, 3, 4, 5]

p array.reduce(10) { |x, acc| p acc - x}
# def reduce(arr, acc = 0)
#   output = acc
#   arr.each do |e|
#     output = yield(output, e)
#   end
#   output
# end

# p reduce(array) { |acc, num| acc + num }                    # => 15
# p reduce(array, 10) { |acc, num| acc + num }                # => 25
# p reduce(array) { |acc, num| acc + num if num.odd? }        # => NoMethodError: undefined method `+' for nil:NilClass