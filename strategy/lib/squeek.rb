require './lib/quack_behavior'

class Squeek < QuackBehavior
  def initialize; end

  def quack
    puts "Squeek!"
  end
end
