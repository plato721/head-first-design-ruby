require './lib/heat_index_display'
require './spec/observer_examples'
require './spec/display_examples'

describe HeatIndexDisplay do
  let(:hi_display){ described_class.new(double(:fake_observer).as_null_object) }

  it_behaves_like "an observer"
  it_behaves_like "a display"

  it "computes a heat index after pulling from source" do
    observable = double(:observable, temperature: 80.0, humidity: 0.65)

    hi_display.update(observable)

    # not wasting time on the formula. showing the demo will give a number
    # around the temp
    expect(hi_display.heat_index).to be_within(20).of(80)
  end
end
