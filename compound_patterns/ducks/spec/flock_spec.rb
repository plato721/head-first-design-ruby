require './lib/flock'
require './lib/mallard_duck'

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
end
