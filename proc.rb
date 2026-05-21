# block

# { puts "I am a block" }

# do
#   puts "I am a block"
# end

# def example_method
# 	if block_given?
# 		yield
# 	else
# 		puts "No"
# 	end
# end

# example_method { puts "I am a block" }

# proc

# my_proc = Proc.new { puts "I am a Proc" }
# my_proc.call

# def example2(&block)
# 	block.call
# end

# example2(&my_proc)

# def example_proc
# 	a = Proc.new { return puts "I am example_proc Proc" }
# 	a.call
# 	puts "I am example_proc Method"
# end

# example_proc

# my_proc = Proc.new { |a, b| puts "I am a Proc: result=#{a+b.to_i}" }
# my_proc.call(1,2)
# my_proc.call(1)
# my_proc.call(1,4, 5)

# Lambda
# my_lambda = lambda { puts "I am a Lambda" }

# my_lambda.call

# def example3(&block)
# 	block.call
# end

# def example_lambda
# 	b = lambda { return puts "I am example_lambda Lambda" }
# 	b.call
# 	puts "I am example_lambda Method"
# end

# example_lambda

# example3(&my_lambda)

# my_lambda = lambda { |a, b| puts "I am a Lambda: result=#{a+b}" }
# my_lambda.call(1,2)
# my_lambda.call(1, 5)
# my_lambda.call(1,4)

# 1. block -> proc
# 2. proc -> block
# 3. symbol -> proc

# def example_5(&block)
# 	puts block.class # proc
# 	example_6(&block)
# end

# def example_6(&block)
# 	if block_given?
# 		puts "Block present"
# 	else
# 		puts "not"
# 	end
# end

# example_5 { puts "I am block" } # block

# ["niraj", "dipak"].each(&:upcase) # Symbol#to_proc

# class Symbol
# 	def to_proc
# 		Proc.new { puts "I am to_proc" }
# 	end
# end

# ["NIRAJ", "DIPAK"]

class Array
	def each(&block)
		self.map do |str|
			block.call(str)
		end
	end
end

class String
	def upcase
		result = ""

		self.each_char do |ch|
			result += (ch.bytes[0] - 32).chr
		end
		result
	end
end

puts ["niraj", "dipak"].each(&:upcase)