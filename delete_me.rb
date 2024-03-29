array = [1, 2, 3, 4, 5]

def reduce(arr, acc = 0)
  arr.each do |e|
    acc += yield(acc, e)
  end
end

reduce(array) { |acc, num| acc + num }                    # => 15
reduce(array, 10) { |acc, num| acc + num }                # => 25
reduce(array) { |acc, num| acc + num if num.odd? }        # => NoMethodError: undefined method `+' for nil:NilClass