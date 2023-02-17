# https://launchschool.com/exercises/c9181c33

items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
  puts "Let's start gathering food."
  yield(items)
  puts "We've finished gathering!"
end

#1
# gather(items) do | *i, i4|
#   puts i.join(", ")
# 	puts i4
# end

# Let's start gathering food.
# apples, corn, cabbage
# wheat
# We've finished gathering!

#2

# gather(items) do | i1, *i, i4|
#   puts i1
#   puts i.join(", ")
#   puts i4
# end

# Let's start gathering food.
# apples
# corn, cabbage
# wheat
# We've finished gathering!

#3

# gather(items) do | i1, *i|
#   puts i1
#   puts i.join(", ")
# end

# Let's start gathering food.
# apples
# corn, cabbage, wheat
# We've finished gathering!

#4

# gather(items) do | i1, i2, i3, i4|
#   puts [i1, i2, i3, i4].join(", ")
# end

# Let's start gathering food.
# apples, corn, cabbage, and wheat
# We've finished gathering!