# require 'pry'
# convert alphabet to ASCII character code
class CaesarCipher
	attr_accessor :string, :offset

	ALPHABET_BYTE = ("a".ord.."z".ord)
	CAP_ALPHABET_BYTE = ("A".ord.."Z".ord)

	def initialize(string, offset)
		self.string = string
		self.offset = offset
	end

	def caesar_encode
		char_byte = string.split("").map {|i| i.ord} # convert string to encode in array of ASCII code
		char_byte.collect do |char|
			if ALPHABET_BYTE.include?(char)
				 encode(ALPHABET_BYTE,char, offset)
			elsif CAP_ALPHABET_BYTE.include?(char)
				 encode(CAP_ALPHABET_BYTE,char, offset)
			else
				char.chr
			end
		end.join("")
	end

	def caesar_decode
	char_byte = string.split("").map {|i| i.ord}
		char_byte.collect do |char|
			if ALPHABET_BYTE.include?(char)
				 decode(ALPHABET_BYTE,char, offset)
			elsif CAP_ALPHABET_BYTE.include?(char)
				 decode(CAP_ALPHABET_BYTE,char, offset)
			else
				char.chr
			end
		end.join("")
	end

# convert ACSII character code into alphabet index position ex: a = 0, b = 1
# make sure offset position wrap around alphabet modular 26
# add offset to character position-- get offset chr value

	def encode(letters, char, offset)
		((((char - letters.min) + offset) % 26) + letters.min).chr
		# binding.pry
	end

	def decode(letters, char, offset)
		((((char - letters.min) - offset) % 26) + letters.min).chr
		# binding.pry
	end

end
