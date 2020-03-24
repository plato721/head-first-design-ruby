RSpec.shared_examples "a beverage" do
  it "has a cost" do
    cost = described_class.new.cost
    expect(cost.is_a? Float).to be_truthy
  end

  # Test by wrapping itself
  context "wrapping another condiment/beverage" do
    before :all do
      @wrapped_beverage = described_class.new
      @beverage = described_class.new(beverage: @wrapped_beverage)
    end

    it "contains the wrapped description" do
      expect(@wrapped_beverage.description.is_a? String).to be_truthy
      expect(@beverage.description).to match(/#{@wrapped_beverage.description}/)
    end

    it "constains the wrapping description" do
      standalone_beverage = described_class.new
      expect(@beverage.description).to match(/#{standalone_beverage.description}/)
    end

    it "adds to the price" do
      standalone_cost = described_class.new.cost
      expect(standalone_cost * 2).to be_within(0.001).of(@beverage.cost)
    end
  end
end
