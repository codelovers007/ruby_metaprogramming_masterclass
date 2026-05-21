# Method lookup in Ruby

class DataClass
	def data_method
		puts "DataClass"
	end
end

module Abc
	def data_method
		puts "Abc"
	end
end

class Dog < DataClass
	include Abc

	def data_method
		puts "Dog"
	end

	# def method_missing(name, *args)
	# 	puts "#{name} is missing sorry!"
	# end
end

fido = Dog.new
puts Dog.ancestors
fido.data_method