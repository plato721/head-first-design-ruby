require './spec/basic_observable_examples'
require './spec/duck_examples'
require './lib/mallard_duck'

describe MallardDuck do
  it_behaves_like "a duck", described_class.new
  it_behaves_like "an observable duck", described_class.new
  it_behaves_like "a basic observable", described_class.new
end
