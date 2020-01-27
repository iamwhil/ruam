# Using a closure to define a method

class Quote
  def initialize
    @str = "The quick brown fox jumps over the lazy dog."
  end

  # Blocks are closures - has an environment and instruction sequence.
  # Thus define method is first class object.
  define_method :display do 
    puts @str
  end
end

Quote.new.display

class Quote2
  def initialize 
    @str = "The quick brown fox"
  end
end

def create_method_using_a_closure
  str2 = "jumps over a lazy dog."
  Quote2.send(:define_method, :display) do 
    puts "#{@str} #{str2}"
  end
end

create_method_using_a_closure
Quote2.new.display