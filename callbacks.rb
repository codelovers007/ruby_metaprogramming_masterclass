# inherited
# class B
# 	def self.inherited(base)
# 		puts "#{base} is inherited by class B"
# 	end
# end

# # included
# module Attributes
# 	def self.included(base)
# 		puts "Attributes is included in #{base}"
# 	end
# end

# # extended
# module Callbacks
# 	def self.extended(base)
# 		puts "Callbacks is extended in #{base}"
# 	end
# end

# # prepended
# module Validator
# 	def self.prepended(base)
# 		puts "Validator is prepended in #{base}"
# 	end
# end

# class A < B
# 	include Attributes
# 	extend Callbacks
# 	prepend Validator

# 	# method_removed
# 	def self.method_removed(method_name)
# 		puts "#{method_name} is removed from A"
# 	end

# 	# method_undefined
# 	def self.method_undefined(name)
# 		puts "#{name} is undefined"
# 	end

# 	# const_missing
# 	def self.const_missing(name)
# 		puts "Missing constant name for #{name}"
# 		# const_set(name, "Coder")
# 	end

# 	def hello
# 		puts "Hello I am a method of A"
# 	end

# 	def hello2
# 		puts "Hello2 I am a method of A"
# 	end

# 	undef_method :hello2

# 	remove_method :hello
# end

# puts A::NIRAJ


module Callbacks
	def self.included(base)
		base.extend(CallbacksModule)
	end

	module CallbacksModule
		def callbacks
			@callbacks ||= []
		end

		def before_action(method_name)
			callbacks << method_name
		end
	end

	def run_callbacks
		self.class.callbacks.each do |callback|
			send(callback)
		end
	end
end


class Controller
	include Callbacks
  
	def process(action)
		run_callbacks
		send(action)
	end
end

class UsersController < Controller
  before_action :check_user

  def index
    puts "Index Action"
  end

  private

  def check_user
    puts "Checking User"
  end
end

UsersController.new.process(:index)