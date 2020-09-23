require 'duck_examples'
require './lib/mallard_duck'

describe MallardDuck do
  it_behaves_like "a duck", described_class.new
end
