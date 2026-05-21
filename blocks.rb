# block
# { puts "Hello" }

# do
# 	puts "Hello"
# end

# def hello
# 	if block_given?
# 		yield
# 	else
# 		puts "Block not passed"
# 	end
# end

# hello { puts "I am a Block" }

#lambda
# - Argument Error
# my_lambda = lambda { |a, b| puts "I am a Lambda #{a+b}" }

# my_lambda.call(1)
# my_lambda.call(1,3, 3)
# my_lambda.call(1,4)

# def test
# 	my_lambda = lambda { return puts "Hi I am Lambda" }
# 	my_lambda.call
# 	puts "Hi I am test method"
# end

# test

# proc
# - No Argument count
# Return

# def test
# 	my_proc = lambda { return puts "Hi I am Proc" }
# 	my_proc.call
# 	puts "Hi I am test method"
# end

# test

# 1. symbol -> proc #Symbol#to_proc

# class Symbol
# 	def to_proc
# 		Proc.new { puts "Hi I am to_proc" }
# 	end
# end

# def method(&block)
# 	puts block.class
# end

# method(&:abc)

# 2. block -> proc

# def method(&block)
# 	puts block.class
# end

# method { puts "I am block" }

# 3. proc -> block

# def method(&block)
# 	puts block.class # Proc
# 	method_2(&block) #
# end

# def method_2(&block)
# 	if block_given?
# 		puts "Block is given"
# 	else
# 		puts "Not"
# 	end
# end

# method { puts "I am block" }



# ["niraj", "dipak"].each(&:upcase)
# ["NIRAJ", "DIPAK"]

# [1, 2, 3, 4, 5].each(&:double)
# [2, 4, 6, 8, 10]

# class Array
# 	def each(&block)
# 		self.map do |num|
# 			block.call(num)
# 		end
# 	end
# end

# class Integer
# 	def double
# 		self * 2
# 	end
# end


# puts [1, 2, 3, 4, 5].each(&:double)

# ["niraj", "dipak"].each(&:upcase)
# ["NIRAJ", "DIPAK"]

# class Array
# 	def each(&block)
# 		self.map do |str|
# 			block.call(str)
# 		end
# 	end
# end

# class String
# 	def upcase
# 		result = ""
# 		self.each_char do |ch|
# 			 result += (ch.bytes[0] - 32).chr
# 		end
# 		result
# 	end
# end

# puts ["niraj", "dipak"].each(&:upcase)