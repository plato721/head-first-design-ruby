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
    result = test_duck.quack

    expect(result).to be_a String
    expect(result.length > 0).to be_truthy
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
