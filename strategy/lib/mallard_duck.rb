require './lib/fly_with_wings'
require './lib/quack'
require './lib/duck'

class MallardDuck < Duck
  def initialize
    @fly_behavior = FlyWithWings.new
    @quack_behavior = Quack.new
  end

  def display_duck
    puts "I'm a mallard duck. Clearly."
  end
end
