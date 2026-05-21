class User
	def self.method_missing(name, *args)
		if name.to_s.start_with?("find_by_")
			field = name.to_s.delete_prefix("find_by_")
			value = args.first

			puts "select * from users where #{field} = #{value}"
		else
			super
		end
	end

	def respond_to_missing?(name, *args)
		name.to_s.start_with?("find_by_") || super
	end
end

User.find_by_name("Niraj") # Ghost Method
User.find_by_email("ndharwal624@gmail.com") # Ghost Method

user = User.new

puts user.respond_to?("find_by_name")
puts user.respond_to?("find_by_email")
puts user.respond_to?("abcd")
