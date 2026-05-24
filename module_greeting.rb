module Greeting
  def self.included(obj)
    puts "#{obj} Included Greeting"
  end
end

module Greeting2
  def self.extended(obj)
    puts "#{obj} extended Greeting2"
  end
end

module Greeting3
  def self.prepended(obj)
    puts "#{obj} prepended Greeting3"
  end
end

class User
  def self.inherited(obj)
    puts "#{obj} Inherited in User"
  end

  def self.method_added(name)
    puts "#{name} method is added in #{self}"
  end

  def self.method_removed(name)
    puts "#{name} method is removed from #{self}"
  end

  def self.method_undefined(name)
    puts "#{name} method is undefined from #{self}"
  end

  def hello3
    puts "I am hello3"
  end

  def hello2
    puts "I am hello2"
  end

  def hello1
    puts "I am hello1 of User"
  end
  remove_method :hello3
  undef_method :hello1
end

class Person < User
  prepend Greeting3
  extend Greeting2
  include Greeting

  def self.const_missing(name)
    puts "Unable to find the #{name}"
    const_set(name, "Test")
  end

  def hello1
    puts "I am hello1 of Person"
  end

  undef_method :hello1
end

module Callbacks
  def self.included(base)
    base.extend(ClassMethods)
  end

  module ClassMethods
    def before_callbacks
      @before_callbacks ||= []
    end

    def before_action(method_name)
      before_callbacks << method_name
    end
  end

  def run_callbacks
    self.class.before_callbacks.each do |callback|
      send(callback)
    end
  end
end

class Controller
  include Callbacks

  def process(action)
    run_callbacks
    send(action)
  end
end

class UsersController < Controller
  before_action :check_user

  def index
    puts "Index Action"
  end

  private

  def check_user
    puts "Checking User"
  end
end

UsersController.new.process(:index)