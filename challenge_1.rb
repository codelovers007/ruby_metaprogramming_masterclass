# Open Classes Code Challenge
class Integer
	def factorial
		# Write Logic Here
		return self if self.zero?

		return self if self <= 1

		self * (self - 1).factorial
	end
end

puts 5.factorial # 120
puts 0.factorial # 0
puts 1.factorial # 1

class String
	def niraj
		puts "Hello Niraj"
	end
end

"hello".niraj