module Abc
	def data
		puts @count
		puts $global_var
		puts Dog::CONST_VAR
	end
end
class Dog
	include Abc
	@@class_var = 10 # class variable
	$global_var = 50
	CONST_VAR = 40
	
	def speak
		@count = 5 # instance
		puts @@class_var
		puts @count
		puts $global_var
	end

	def test
		name = "Niraj" # local
		puts @@class_var
		puts @count
		puts $global_var
		puts name
	end
end

dog = Dog.new
dog.speak
puts "======================"
dog.test

puts "===========test only==========="
a = Dog.new
a.speak
a.test

puts "===========Module Method==========="
b = Dog.new
b.speak
b.data