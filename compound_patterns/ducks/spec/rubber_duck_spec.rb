require './lib/rubber_duck'
require './spec/basic_observable_examples'
require './spec/duck_examples'

describe RubberDuck do
  it_behaves_like "a duck", described_class.new
  it_behaves_like "an observable duck", described_class.new
  it_behaves_like "a basic observable", described_class.new
end
