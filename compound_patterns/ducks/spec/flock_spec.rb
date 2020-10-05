require './lib/flock'
require './lib/mallard_duck'
require './spec/duck_examples'
require './spec/basic_observable_examples'

RSpec.describe Flock do
  it_behaves_like "a duck", Flock.new

  it "takes ducks" do
    flock = Flock.new
    mallard = MallardDuck.new

    expect{
      flock.add(mallard)
    }.to_not raise_error
  end

  it "quacks the ducks" do
    duck1 = double(:duck)
    duck2 = double(:duck)
    allow(duck1).to receive(:quack)
    allow(duck2).to receive(:quack)

    flock = Flock.new
    flock.add(duck1)
    flock.add(duck2)

    flock.quack

    expect(duck1).to have_received(:quack)
    expect(duck2).to have_received(:quack)
  end

  it "registers observers with the ducks" do
    duck1 = double(:duck)
    duck2 = double(:duck)
    allow(duck1).to receive(:register_observer)
    allow(duck2).to receive(:register_observer)
    observer = double(:observer)

    flock = Flock.new
    flock.add(duck1)
    flock.add(duck2)

    flock.register_observer(observer)

    expect(duck1).to have_received(:register_observer).exactly(1).times
                       .with(observer)
    expect(duck2).to have_received(:register_observer).exactly(1).times
                       .with(observer)
  end
end
