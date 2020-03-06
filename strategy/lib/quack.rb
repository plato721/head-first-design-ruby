require './lib/quack_behavior'

class Quack < QuackBehavior
  def initialize; end

  def quack
    puts "Regular ol' quack happening."
  end
end
