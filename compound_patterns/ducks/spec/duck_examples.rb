RSpec.shared_context "ducks" do
  def ducks_with_classes
    [
      ["mallard_duck", MallardDuck],
      ["darkwing_duck", DarkwingDuck],
      ["rubber_duck", RubberDuck],
      ["decoy_duck", DecoyDuck],
      ["duck_call", DuckCall]
    ]
  end
end

RSpec.shared_examples "a duck" do |test_duck|
  it "quacks" do
    expect{
      test_duck.quack
    }.to_not raise_error
  end
end

RSpec.shared_examples "an observable duck" do |test_duck|
  it "notifies an observable when quacking" do
    observable = double(:observable, notify_observers: nil)
    allow(test_duck).to receive(:observable){ observable }

    test_duck.quack

    expect(observable).to have_received(:notify_observers).exactly(1).times
  end
end

RSpec.shared_examples "a duck factory" do |factory|
  include_context "ducks"

  it "makes all the ducks" do
    ducks_with_classes.each do |duck, duck_class|
      duck_create_method = "create_#{duck}".to_sym
      result = factory.send(duck_create_method)

      # if we already have shared examples for the duck "interface", wouldn't it
      # be nice to use that? hmm.
      expect(result).to respond_to(:quack)
    end
  end
end
