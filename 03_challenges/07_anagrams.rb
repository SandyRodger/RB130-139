# https://launchschool.com/exercises/b7be1b38

class Anagram
	attr_reader :word

	def initialize(word)
		@word = word
	end

	def match(array)
		array.each_with_object([]) do |word_2, matches|
			if (word_2.downcase.chars.sort == word.downcase.chars.sort) && (word.downcase != word_2.downcase)
				matches << word_2
			end
		end
	end
end

# LS solution:

# class Anagram
#   attr_reader :word

#   def initialize(word)
#     @word = word.downcase
#   end

#   def match(word_array)
#     word_array.select do |ana|
#       ana.downcase != word && anagram?(ana, word)
#     end
#   end

#   private

#   def sorted_letters(str)
#     str.downcase.chars.sort.join
#   end

#   def anagram?(word1, word2)
#     sorted_letters(word1) == sorted_letters(word2)
#   end
# end