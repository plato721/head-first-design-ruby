#!/usr/bin/env ruby

Dir['./lib/**/*.rb'].each { |f| require f}

class DuckSimulator
  def initialize(duck_factory=nil)
    @duck_factory = duck_factory
    @duck_factory ||= QuackCounterFactory.new
  end

  def perform
    all_ducks = Flock.new

    # some assorted ducks
    ducks = ["mallard_duck", "decoy_duck", "darkwing_duck", "rubber_duck"]
    ducks.each do |type|
      duck = @duck_factory.send("create_#{type}".to_sym)
      all_ducks.add(duck)
    end

    # our goose
    all_ducks.add(GooseAdapter.new(Goose.new))

    # mallards only, nested flock
    mallard_ducks = Flock.new
    5.times { mallard_ducks.add(@duck_factory.create_mallard_duck) }
    all_ducks.add(mallard_ducks)

    # our observer
    zoologist = Zoologist.new
    all_ducks.register_observer(zoologist)

    all_ducks.quack

    puts "Total quacks: #{QuackCounter.quack_count}"
  end
end

sim = DuckSimulator.new
sim.perform
