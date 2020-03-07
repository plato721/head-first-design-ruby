require './spec/observer_examples'
require './spec/display_examples'
require './lib/current_conditions_display'

describe CurrentConditionsDisplay do
  let(:current_display){ described_class.new(double(:observable).as_null_object) }

  it_behaves_like "an observer"
  it_behaves_like "a display"

  it "displays some current conditions" do
    observable = double(:observable)
    allow(observable).to receive(:temperature).and_return(-5.32, 15.98)
    allow(observable).to receive(:pressure).and_return(29.88, 30.24)
    allow(observable).to receive(:humidity).and_return(0.54, 0.08)

    current_display.update(observable)

    expected = /temp.*-5\.32.+humidity.*[^\.]54.*%.+pressure.*29\.88/i
    expect(current_display.display_message).to match(expected)
  end
end
