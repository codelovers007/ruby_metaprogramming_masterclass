# Singleton method
# Singleton class/Eigenclass

class Dog
	def speak # Instance Method
		puts "Woof!"
	end

	class << self
		def speak2
			puts "Woof Woof Woof!"
		end
	end
end

puts Dog.speak2
puts Dog.singleton_class.instance_methods(false)