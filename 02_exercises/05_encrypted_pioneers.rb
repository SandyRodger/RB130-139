# https://launchschool.com/exercises/6990f3dc

ALPHABET = ("a".."z").to_a + ("a".."z").to_a

def decipher(str)
	output = str.downcase.split(" ").each_with_object([]) do |word, output|
		letters = word.split("")
		deciphered_word = []
		letters.each do |letter|
			if letter == "-"
				deciphered_word << letter 
				next
			end
			new_idx = ALPHABET.index(letter) + 13
			deciphered_word << ALPHABET[new_idx]
		end
		output << deciphered_word.join("")
	end	
	output.map(&:capitalize).join(" ")
end

p decipher("Nqn Ybirynpr")
p decipher("Tenpr Ubccre")
p decipher("Nqryr Tbyqfgvar")
p decipher("Nyna Ghevat")
p decipher("Puneyrf Onoontr")
p decipher("Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv")
p decipher("Wbua Ngnanfbss")
p decipher("Ybvf Unvog")
p decipher("Pynhqr Funaaba")
p decipher("Fgrir Wbof")
p decipher("Ovyy Tngrf")
p decipher("Gvz Orearef-Yrr")
p decipher("Fgrir Jbmavnx")
p decipher("Xbaenq Mhfr")
p decipher("Fve Nagbal Ubner")
p decipher("Zneiva Zvafxl")
p decipher("Lhxvuveb Zngfhzbgb")
p decipher("Unllvz Fybavzfxv")
p decipher("Tregehqr Oynapu")