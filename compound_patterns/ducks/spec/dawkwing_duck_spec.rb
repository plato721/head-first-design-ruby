require './lib/darkwing_duck'
require './spec/duck_examples'

describe DarkwingDuck do
  it_behaves_like "a duck", described_class.new
end
