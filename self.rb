# self in Ruby

class DataClass
	puts "DataClass self: #{self}"

	def data_method
		puts "data_method self: #{self}"
	end
end

module Abc
	puts "Module self: #{self}"

	def module_method
		puts "module_method self: #{self}"
	end
end

class Dog < DataClass
  puts "Class self: #{self}"

	include Abc

  def method_1
		puts "method_1 self: #{self}"
  end

	def self.method_2
		puts "method_2 self: #{self}"
  end
end

fido = Dog.new
fido.method_1
Dog.method_2
fido.module_method
fido.data_method