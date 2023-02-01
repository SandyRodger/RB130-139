# https://launchschool.com/exercises/1e706bb0

def compute
	if block_given?
		yield
	else
		'Does not compute.'
	end
end

def compute
  return 'Does not compute.' unless block_given?
  yield
end

compute { 5 + 3 } == 8
compute { 'a' + 'b' } == 'ab'
compute == 'Does not compute.'

def compute(n)
	return 'Does not compute.' unless block_given?
	yield(n)
end

p compute(3) == "Does not compute."
p compute(3) {|num| num ** num} == 27
p compute(3) {|t| t.times {puts "test"}} == 3