module Greetable
  def speak
    "Module says: Hi!"
  end
end

class Dog
  extend Greetable

  def self.speak3
    "Dog says: Woof!"
  end
end

puts "==================Method Lookup For Extended Module========================"
puts Dog.speak       # => "Dog says: Woof!"
puts "===================================Normal Class========================================="
puts Dog.ancestors
puts "==================================Singleton Class=========================================="
puts Dog.singleton_class.ancestors