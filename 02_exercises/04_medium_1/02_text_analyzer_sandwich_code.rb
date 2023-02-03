# https://launchschool.com/exercises/c618c0e4

class TextAnalyzer
  def process(units)
    split_arr = yield(File.read("text_file.txt"))
		puts "#{split_arr.size} #{units}"
	end
end

analyzer = TextAnalyzer.new
analyzer.process("words") { |str| str.split(" ")}
analyzer.process("lines") { |str| str.split(/\n/)}
analyzer.process("paragraphs") { |str| str.split(/\n\n/)}


# LS solution:

# class TextAnalyzer
#   def process
#     file = File.open('text_file.txt', 'r')
#     yield(file.read)
#     file.close
#   end
# end

# analyzer = TextAnalyzer.new
# analyzer.process { |text| puts "#{text.split("\n\n").count} paragraphs" }
# analyzer.process { |text| puts "#{text.split("\n").count} lines" }
# analyzer.process { |text| puts "#{text.split(' ').count} words" }

# 3 paragraphs
# 15 lines
# 126 words