#!/usr/bin/env ruby

Dir['./lib/**/*.rb'].each { |f| require f}

class DuckSimulator
  def initialize(duck_factory=nil)
    @duck_factory = duck_factory
    @duck_factory ||= QuackCounterFactory.new
  end

  def perform
    zoologist = Zoologist.new

    mallard_ducks = Flock.new
    5.times { mallard_ducks.add(@duck_factory.create_mallard_duck) }

    all_ducks = Flock.new

    ducks = ["mallard_duck", "decoy_duck", "darkwing_duck", "rubber_duck"]
    ducks.each do |type|
      duck = @duck_factory.send("create_#{type}".to_sym)
      all_ducks.add(duck)
    end

    all_ducks.add(GooseAdapter.new(Goose.new))
    all_ducks.add(mallard_ducks)

    all_ducks.register_observer(zoologist)

    all_ducks.quack

    puts "Total quacks: #{QuackCounter.quack_count}"
  end
end

sim = DuckSimulator.new
sim.perform
