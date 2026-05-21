module Greetable1
  def speak
    "Module1 says: Hi!"
  end
end

class Dog1
  prepend Greetable1

  def speak
    "Dog1 says: Woof!"
  end
end

puts "==================Method Lookup For Prepended Module========================"
puts Dog1.new.speak       # => "Module1 says: Hi!"
puts "============================================================================"
puts Dog1.ancestors       # => [Greetable1, Dog1, Animal, Object, Kernel, BasicObject]

module Greetable2
  def speak
    "Module2 says: Hi!"
  end
end

class Dog2
  include Greetable2

  def speak
    "Dog2 says: Woof!"
  end
end

puts "==================Method Lookup For Included Module========================"
puts Dog2.new.speak       # => "Dog2 says: Woof!"
puts "============================================================================"
puts Dog2.ancestors       # => [Dog2, Greetable2, Animal, Object, Kernel, BasicObject]

module Greetable3
  def speak
    "Module3 says: Hi!"
  end
end

class Dog3
  extend Greetable3

  def speak
    "Dog3 says: Woof!"
  end
end

puts "==================Method Lookup For Extended Module========================"
puts Dog3.new.speak       # => "Dog3 says: Woof!"
puts "============================================================================"
puts Dog3.ancestors       # => [Dog3, Animal, Object, Kernel, BasicObject]