require './lib/rubber_duck'
require './spec/duck_examples'

describe RubberDuck do
  it_behaves_like "a duck", described_class.new
end
