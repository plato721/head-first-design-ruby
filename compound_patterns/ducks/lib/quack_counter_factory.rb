require './lib/darkwing_duck'
require './lib/decoy_duck'
require './lib/duck_call'
require './lib/mallard_duck'
require './lib/rubber_duck'

class QuackCounterFactory
  def create_mallard_duck
    QuackCounter.new(MallardDuck.new)
  end

  def create_darkwing_duck
    QuackCounter.new(DarkwingDuck.new)
  end

  def create_rubber_duck
    QuackCounter.new(RubberDuck.new)
  end

  def create_decoy_duck
    QuackCounter.new(DecoyDuck.new)
  end

  def create_duck_call
    QuackCounter.new(DuckCall.new)
  end
end
