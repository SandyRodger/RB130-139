# https://launchschool.com/exercises/243941c0

class Scrabble
	attr_reader :str
	attr_accessor :score
	
	SCORES = {"aeioulnrst"	=> 1,
	"dg" =>	2,
	"bcmp" =>	3,
	"fhvwy" =>	4,
	"k" =>	5,
	"jx"	=> 8,
	"qz" =>	10
}

	def initialize(str)
		@str = str.nil? ? "" : str.downcase.chars.select{|l| l =~ /[a-z]/}
	end

	def self.score(word)
		Scrabble.new(word).score
	end

	def score
		score = 0
		return score if str.empty?
		str.each do |char|
			SCORES.each do |k, v|
				score += v if k.include?(char)
			end
		end
		score
	end
end
