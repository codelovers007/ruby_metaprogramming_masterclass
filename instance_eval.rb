# instance_eval
# puts self.class

class Test
	def config(&block)
		puts "config method self: #{self}"
		instance_eval(&block)
	end

	def upcase(name)
		puts self
		puts "object method upcase"
	end

	def downcase(name)
		puts self
		puts "object method downcase"
	end
end

t = Test.new

t.config do
	upcase 'niraj'
	downcase 'DIPAK'
end