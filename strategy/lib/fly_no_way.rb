require './lib/fly_behavior'

class FlyNoWay < FlyBehavior
  def initialize; end

  def fly
    puts "Grounded."
  end
end