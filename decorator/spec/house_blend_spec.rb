require './spec/beverage_examples'
require './lib/house_blend'

describe HouseBlend do
  it_behaves_like "a beverage"

  it "has a well-formed description" do
    expect(subject.description).to match(/house blend/i)
  end
end
