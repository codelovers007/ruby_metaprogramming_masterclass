
# # puts self

# def upcase(name)
# 	puts name
# end

# def downcase(name)
# 	puts name
# end

# class Test

# 	def config(&block)
# 		instance_eval(&block)
# 	end

# 	def upcase(name)
# 		puts name.upcase
# 	end

# 	def downcase(name)
# 		puts name.downcase
# 	end
# end


# t = Test.new

# t.config do
# 	upcase 'niray'
# 	downcase 'DIPAK'
# 	puts self
# end

# class Router
# 	def draw(&block)
# 		instance_eval(&block)
# 	end

# 	def get(path)
# 		puts @namespace ? "GET #{@namespace}#{path}" : "GET #{path}"
# 	end

# 	def put(path)
# 		puts @namespace ? "PUT #{@namespace}#{path}" : "PUT #{path}"
# 	end

# 	def namespace(name, &block)
# 		@namespace = name

# 		instance_eval(&block)

# 		@namespace = nil
# 	end
# end

# Router.new.draw do
# 	get '/home'

# 	namespace 'admin' do
# 		get '/users'
# 	end
	
# 	namespace 'user' do
# 		put '/posts/:id'
# 	end
# end
class User
end


[:name, :surname, :age].each do |field|
	User.class_eval do
		define_method(field) do
			instance_variable_get("@#{field}")
		end

		define_method("#{field}=") do |value|
			instance_variable_set("@#{field}", value)
		end
	end
end

u = User.new
u.name = "Niraj"
u.surname = "Dharwal"
u.age = 10

puts u.name
puts u.surname
puts u.age