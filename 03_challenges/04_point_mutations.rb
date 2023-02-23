# class DNA
# 	attr_reader :dna
# 	def initialize(dna)
# 		@dna = dna
# 	end

# 	def hamming_distance(other_dna)
# 		return 0 if both_strings_empty?(other_dna) || strings_identical?(other_dna)
# 		shorter_str = shorter_str(other_dna)
# 		longer_str = longer_str(other_dna)
# 		total_diff = 0
# 		shorter_str.chars.each_with_index do |char, idx|
# 			total_diff += 1 if char != longer_str[idx]
# 		end
# 		total_diff
# 	end

# 	def both_strings_empty?(other_dna)
# 		dna.length == 0 && other_dna.length == 0
# 	end

# 	def strings_identical?(other_dna)
# 		dna == other_dna
# 	end

# 	def shorter_str(other_dna)
# 		dna.length >= other_dna.length ? other_dna : dna
# 	end

# 	def longer_str(other_dna)
# 		dna.length >= other_dna.length ? dna : other_dna
# 	end

# 	def strings_equal_length?(other_dna)
# 		dna.length == other_dna.length
# 	end
# end

# LS solution:

class DNA
  def initialize(strand)
    @strand = strand
  end

  def hamming_distance(comparison)
    shorter = @strand.length < comparison.length ? @strand : comparison
    differences = 0

    shorter.length.times do |index|
      differences += 1 unless @strand[index] == comparison[index]
    end

    differences
  end
end