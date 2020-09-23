require './lib/duck_call'
require './spec/duck_examples'

describe DuckCall do
  it_behaves_like "a duck", described_class.new
end
