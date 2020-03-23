require './lib/beverage'

describe Beverage do
  it "is abstract" do
    expect{
      described_class.new
    }.to raise_error
  end

  class FakeBeverage < Beverage
    def initialize; end
  end

  it "has a description" do
    fake_bev = FakeBeverage.new

    expect(fake_bev.description.is_a? String).to be_truthy
    expect(fake_bev.description).to_not be_empty
  end
end
