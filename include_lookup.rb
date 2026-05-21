module Greetable
  def speak1
    "Module says: Hi!"
  end
end

class Dog
  include Greetable

  def speak1
    "Dog says: Woof!"
  end

  def method_missing(name, *args)
    if name == :speak || name == :speak2
      puts "Hi I am present....."
    else
      super
    end
  end
end

fido = Dog.new
fido.speak2
