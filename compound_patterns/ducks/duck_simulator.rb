#!/usr/bin/env ruby

Dir['./lib/**/*.rb'].each { |f| require f}

class DuckSimulator
  def perform
    ducks = [MallardDuck, DecoyDuck, DarkwingDuck, DuckCall, RubberDuck]

    ducks.map!{ |duck_type| duck_type.new }

    ducks.each { |duck| puts duck.quack }
  end
end

sim = DuckSimulator.new
sim.perform
