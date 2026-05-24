# eval
# input = "5 + 3"
# puts eval(input)

# class_eval
# User.class_eval do
# 	def hello
# 		puts "I am class eval"
# 	end
# end

# class User
# end

# [:name, :age].each do |field|
# 	User.class_eval do
# 		define_method(field) do
# 			instance_variable_get("@#{field}")
# 		end

# 		define_method("#{field}=") do |value|
# 			instance_variable_set("@#{field}", value)
# 		end
# 	end
# end

# user = User.new
# user.name = "Niraj"
# user.age = 35

# puts user.name
# puts user.age

# instance_eval

# class User
# 	def hello
# 		puts "Hello I am user object"
# 	end
# end

# user = User.new

# user1 = User.new

# user.instance_eval do
# 	def hello
# 		puts "Hello I am user object"
# 	end
# end

# user.hello

class Routes
	def draw(&block)
		instance_eval(&block)
	end

	def get(path)
		puts @namespace ? "GET #{@namespace}#{path}" : "GET #{path}"
	end

	def put(path)
		puts "PUT #{path}"
	end

	def namespace(name, &block)
		@namespace = name
		instance_eval(&block)
	end
end

Routes.new.draw do
	get "/user"

	put "/posts/:id"

	namespace "admin" do 
		get "/comments"
	end

	namespace "user" do 
		get "/images"
	end

	put "/comments/:id"
end
