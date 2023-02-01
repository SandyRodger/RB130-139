# https://launchschool.com/exercises/8b99f281

def divisors(n)
	(1..n).to_a.each_with_object([]) do |n2, output|
		output << n2 if n % n2 == 0
	end
end

# LS solution:

def divisors(number)
  1.upto(number).select do |candidate|
    number % candidate == 0
  end
end


p divisors(1) == [1]
p divisors(7) == [1, 7]
p divisors(12) == [1, 2, 3, 4, 6, 12]
p divisors(98) == [1, 2, 7, 14, 49, 98]
p divisors(99400891) == [1, 9967, 9973, 99400891] # may take a minute