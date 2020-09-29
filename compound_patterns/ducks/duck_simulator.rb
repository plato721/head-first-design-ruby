#!/usr/bin/env ruby

Dir['./lib/**/*.rb'].each { |f| require f}

class DuckSimulator
  def perform
    ducks = [MallardDuck, DecoyDuck, DarkwingDuck, DuckCall, RubberDuck]

    ducks.map!{ |duck_type| count_wrap(duck_type.new) }
    ducks << GooseAdapter.new(Goose.new)

    ducks.each { |duck| puts duck.quack }

    puts "Total quacks: #{QuackCounter.quack_count}"
  end

  private
  def count_wrap(duck)
    QuackCounter.new(duck)
  end
end

sim = DuckSimulator.new
sim.perform
