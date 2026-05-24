class MiniRSpec
  def describe(text, &block)
    puts "\n#{text}"

    instance_eval(&block)
  end

  def context(text, &block)
    puts "\nContext: #{text}"

    instance_eval(&block)
  end

  def before(&block)
    @before_block = block
  end

  def let(name, &block)
    define_singleton_method(name) do
      instance_eval(&block)
    end
  end

  def it(text, &block)
    print " - #{text}: "

    @before_block.call if @before_block

    instance_eval(&block)
  end

  def expect(actual)
    Expectation.new(actual)
  end
end

class Expectation
  def initialize(actual)
    @actual = actual
  end

  def to_eq(expected)
    if @actual == expected
      puts "PASSED"
    else
      puts "FAILED"
      puts "Expected #{expected}, got #{@actual}"
    end
  end
end

class Calculator
	def add(a, b)
		a + b
	end
end

RSpec.new.describe "Calculator" do
	before do
		@calculator = Calculator.new
	end

	let(:a) { 10 }
	let(:b) { 5 }

	context ".addition" do
		it "adds two numbers" do
			result = @calculator.add(a, b)

			expect(result).to_eql(15)
		end
	end
end 
