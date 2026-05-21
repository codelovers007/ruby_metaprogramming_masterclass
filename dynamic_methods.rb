# 1. define_method # Dynamically define method at runtime

# 2. send/public_send # Dynamically calling methods at runtime
# 3. respond_to? # Object method to check method in object
# 4. method_defined?  # class public and protected method checks
# 5. instance_methods(false) # List all public instance methods
# 6. private_instance_methods(false) # Include private methods

# 7. remove_method # remove current class method, still in superclass, method lookup works
# 8. undef_method  # blocks method entirely, method lookup will not work.

# 9. instance_variables # get all class instance variables
# 10. instance_variable_get # get instance variables from class
# 11. instance_variable_set # set instance variables to class

module Attribute
	def attr_accessor_custom(*name)
		name.each do |name|
			# Getter Method
			define_method(name) do
				instance_variable_get("@#{name}")
			end

			# Setter Method
			define_method("#{name}=") do |value|
				instance_variable_set("@#{name}", value)
			end
		end
	end
end

class Dog
	extend Attribute

	attr_accessor_custom :name, :age, :description
end

a = Dog.new

a.name = "Niraj"
a.age = 35
a.description = "Hi"

puts a.instance_variables
puts a.name
puts a.age
puts a.description