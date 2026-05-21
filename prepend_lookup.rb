module Greetable
  def speak
    "Module says: Hi!"
  end
end

class Dog
  prepend Greetable

  def speak
    "Dog says: Woof!"
  end
end

puts "==================Method Lookup For Prepended Module========================"
puts Dog.new.speak       # => "Module says: Hi!"
puts "============================================================================"
puts Dog.ancestors