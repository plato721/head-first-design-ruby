require './lib/quack_counter'
require './lib/mallard_duck'
require './spec/duck_examples'
describe QuackCounter do
  it_behaves_like "a duck", QuackCounter.new(duck: MallardDuck.new)

  it "has a counter" do
    # duck = MallardDuck.new
    # qc = QuackCounter.new(duck)
    #
    expect(QuackCounter.quack_count).to be_a Integer
  end

  it "counts quacks" do
    current_count = described_class.quack_count
    qc = described_class.new(duck: MallardDuck.new)

    qc.quack
    expect(current_count + 1).to eq(described_class.quack_count)

    qc.quack
    expect(current_count + 2).to eq(described_class.quack_count)
  end

end
