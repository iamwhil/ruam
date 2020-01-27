# Who Am I? How self changes with Lexical Scope

puts "From the top!"
p self
# => main
p Module.nesting
# => []

puts "\nSelf inside of a class with new lexical scope."
class Quote
  p self
  # => Quote
  p Module.nesting
  # => [Quote] <- Lexical Stack
end

# use class << self syntax to create a metaclass scope.

puts "\nSelf inside of a metaclass"
class Quote
  p self
  p Module.nesting
  class << self
    p self
    # => #<Class:Quote>
    p Module.nesting
    # => #[#<Class:Quote>, Quote]

    def class_method
      p "Self: #{self}"
      p "Module.nesting: #{Module.nesting}"
    end
  end
end

puts "\nRuby sets self to the receiver."
# When you call a class method we call that method on a receiver
# Ruby sets self to the receiver.
# Quote.class_method
# Quote is the receiver... self becomes quote.
Quote.class_method