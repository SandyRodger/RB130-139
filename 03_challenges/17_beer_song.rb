# https://launchschool.com/exercises/87b886ff

class BeerSong

	def self.lyrics
		verses(99, 0)
	end

	def self.verse(n)
		first_line_of_verse(n) + second_line_of_verse(n)
	end

	def self.first_line_of_verse(num)
 		"#{num.zero? ? "No more" : num} bottle#{"s" if num != 1} of beer on the wall, #{num.zero? ? "no more" : num} bottle#{"s" if num != 1} of beer.\n"\
	end

	def self.second_line_of_verse(num)
		if num.zero?
			"Go to the store and buy some more, 99 bottles of beer on the wall.\n"
		else 
			"Take #{num > 1 ? "one" : "it"} down and pass it around, #{(num -= 1).zero? ? "no more" : num} bottle#{"s" if num != 1} of beer on the wall.\n"
		end
	end

	def self.verses(start_v, end_v)
		(end_v..start_v).to_a.reverse.each_with_object("") do |v_num, output|
			output << verse(v_num) + "\n"
		end[0..-2]
	end
end

# LS solution:

# class Verse
#   attr_reader :bottles

#   def initialize(bottles)
#     @bottles = bottles
#   end

#   def single_verse
#     case bottles
#     when 0
#       zero_bottle_verse
#     when 1
#       single_bottle_verse
#     when 2
#       two_bottle_verse
#     else
#       default_verse
#     end
#   end

#   private

#   def default_verse
#     "#{bottles} bottles of beer on the wall, #{bottles}" +
#     " bottles of beer.\nTake one down and pass it around, " +
#     "#{bottles-1} bottles of beer on the wall.\n"
#   end

#   def two_bottle_verse
#     "2 bottles of beer on the wall, 2 bottles of beer.\n" +
#     "Take one down and pass it around, 1 bottle of beer " +
#     "on the wall.\n"
#   end

#   def single_bottle_verse
#     "1 bottle of beer on the wall, 1 bottle of beer.\n" +
#     "Take it down and pass it around, no more bottles of beer " +
#     "on the wall.\n"
#   end

#   def zero_bottle_verse
#     "No more bottles of beer on the wall, no more bottles " +
#     "of beer.\nGo to the store and buy some more, 99 bottles " +
#     "of beer on the wall.\n"
#   end
# end

# class BeerSong
#   def self.verse(number)
#     Verse.new(number).single_verse
#   end

#   def self.verses(start, stop)
#     current_verse = start
#     result = []

#     while current_verse >= stop
#       result << "#{verse(current_verse)}"
#       current_verse -= 1
#     end

#     result.join("\n")
#   end

#   def self.lyrics
#     verses(99, 0)
#   end
# end