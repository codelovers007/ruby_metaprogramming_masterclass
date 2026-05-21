# Variables in Ruby

class DataClass
	def data_method
		puts "data_method instance var: #{@instance_var}"
		# puts "data_method class var: #{@@class_var}" # Can not access outside of the class
		puts "data_method global var: #{$gloabl_var}"
		puts "data_method CONST VAR: #{Dog::CONST_VAR}"
	end
end

module Abc
	def module_method
		puts "module_method instance var: #{@instance_var}"
		puts "module_method global var: #{$gloabl_var}"
		puts "module_method CONST VAR: #{Dog::CONST_VAR}"
		# puts "module_method class var: #{@@class_var}" # Can not access outside of the class
	end
end

class Dog  < DataClass
	@@class_var = 50
	$gloabl_var = 10
	CONST_VAR = 200

	include Abc

  def method_1
		puts "method_1 instance var: #{@instance_var}"
		puts "method_1 class var: #{@@class_var}"
		puts "method_1 global var: #{$gloabl_var}"
		puts "method_1 CONST VAR: #{CONST_VAR}"
		# puts "method_1 local var: #{local_var}" # Cannot access outside of the scope
  end

	def self.method_2
		puts "method_2 instance var: #{@instance_var}"
		puts "method_2 class var: #{@@class_var}"
		puts "method_2 global var: #{$gloabl_var}"
		puts "method_2 CONST VAR: #{CONST_VAR}"
  end

	def method_3
		local_var = 10
		puts "method_3 local var: #{local_var}"
		puts "method_3 instance var: #{@instance_var}"
		puts "method_3 class var: #{@@class_var}"
		puts "method_3 global var: #{$gloabl_var}"
		puts "method_3 CONST VAR: #{CONST_VAR}"
	end

	def method_4
		@instance_var = 100
		puts "method_4 instance var: #{@instance_var}"
		puts "method_4 class var: #{@@class_var}"
		puts "method_4 global var: #{$gloabl_var}"
		puts "method_4 CONST VAR: #{CONST_VAR}"
	end
end

fido = Dog.new
puts "==========fido.method_4============="
fido.method_4
puts "==========fido.method_1============="
fido.method_1
puts "==========Dog.method_2============="
Dog.method_2
puts "==========fido.method_3============="
fido.method_3

puts "==========fido.data_method============="
fido.data_method
puts "==========fido.module_method============="
fido.module_method

