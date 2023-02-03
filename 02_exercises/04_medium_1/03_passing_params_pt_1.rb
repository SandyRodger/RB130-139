# https://launchschool.com/exercises/c7f39d55

items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
  yield("Let's start gathering food.")
  yield("#{items.join(', ')}")
  yield("Nice selection of food we have gathered!")
end


# LS solution ( i misread instructions)

def gather(items)
  puts "Let's start gathering food."
  yield(items)
  puts "Nice selection of food we have gathered!"
end

gather(items) { |produce| puts produce.join('; ') }

gather(items){|sentence| puts sentence}
