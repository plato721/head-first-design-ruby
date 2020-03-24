require './spec/beverage_examples'
require './lib/dark_roast'

describe DarkRoast do
  it_behaves_like "a beverage"

  it "has a well-formed description" do
    expect(subject.description).to match(/dark roast/i)
  end
end
