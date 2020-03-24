require './lib/beverage_demo'

describe BeverageDemo do
  it "builds a beverage" do
    beverage = described_class.new.build([Espresso])

    expect(beverage.cost).to be_within(0.001).of(1.99)
    expect(beverage.description).to eq("Espresso")
  end

  it "builds another beverage" do
    beverage_list = [DarkRoast, Mocha, Mocha, Whip]
    beverage = described_class.new.build(beverage_list)

    expect(beverage.description).to eq("Dark Roast Coffee, Mocha, Mocha, Whip")
    expect(beverage.cost).to be_within(0.001).of(1.49)
  end

  it "builds a different beverage" do
    beverage_list = [HouseBlend, Soy, Mocha, Whip]
    beverage = described_class.new.build(beverage_list)

    expect(beverage.description).to eq("House Blend Coffee, Soy, Mocha, Whip")
    expect(beverage.cost).to be_within(0.001).of(1.34)
  end
end
