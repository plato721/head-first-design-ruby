require './lib/decoy_duck'
require './spec/duck_examples'

describe DecoyDuck do
  it_behaves_like "a duck", described_class.new
end
