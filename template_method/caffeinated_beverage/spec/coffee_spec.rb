require './lib/coffee'
require './spec/caffeinated_examples_spec'

describe Coffee do
  it "is the thing" do
    expect(described_class.new).to be_a(Coffee)
  end

  it_behaves_like "a caffeinated beverage"
end
