require './lib/quack_counter_factory'
require './lib/quack_counter'
require './spec/duck_examples'

RSpec.describe QuackCounterFactory do
  include_context "ducks"

  it_behaves_like "a duck factory", described_class.new

  it "wraps the ducks in a QuackCounter" do
    qc_factory = described_class.new

    ducks_with_classes.each do |duck, _|
      duck_create_method = "create_#{duck}".to_sym
      duck = qc_factory.send(duck_create_method)

      expect(duck).to be_a(QuackCounter)
    end
  end
end
