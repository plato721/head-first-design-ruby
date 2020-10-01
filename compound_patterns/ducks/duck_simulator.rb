#!/usr/bin/env ruby

Dir['./lib/**/*.rb'].each { |f| require f}

class DuckSimulator
  def initialize(duck_factory=nil)
    @duck_factory = duck_factory
    @duck_factory ||= QuackCounterFactory.new
  end

  def perform
    ducks = ["mallard_duck", "decoy_duck", "darkwing_duck", "rubber_duck"]

    ducks.map!{ |duck_type| @duck_factory.send("create_#{duck_type}".to_sym) }
    ducks << GooseAdapter.new(Goose.new)

    ducks.each { |duck| puts duck.quack }

    puts "Total quacks: #{QuackCounter.quack_count}"
  end
end

sim = DuckSimulator.new
sim.perform
