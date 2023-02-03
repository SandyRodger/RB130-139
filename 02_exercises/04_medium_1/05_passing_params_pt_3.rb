# https://launchschool.com/exercises/c9181c33

items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
  puts "Let's start gathering food."
  yield(items)
  puts "We've finished gathering!"
end

#1
gather(items) do | items1, items2|
  puts items1
  puts items2
end

# Let's start gathering food.
# apples, corn, cabbage
# wheat
# We've finished gathering!