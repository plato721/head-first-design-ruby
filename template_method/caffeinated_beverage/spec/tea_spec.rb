require './lib/tea'
require './spec/caffeinated_examples_spec'

describe Tea do
  it "is the thing" do
    expect(described_class.new).to be_a(Tea)
  end

  it_behaves_like "a caffeinated beverage"
end
