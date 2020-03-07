require './lib/forecast_display'
require './spec/observer_examples'
require './spec/display_examples'

describe ForecastDisplay do
  let(:forecast_display){ described_class.new(double(:subject).as_null_object) }

  it_behaves_like "an observer"
  it_behaves_like "a display"

  it "falling pressure is bad weather once computable" do
    observable = double(:observable)
    allow(observable).to receive(:pressure).and_return(30,29)

    forecast_display.update(observable)
    expect(forecast_display.display_message).to match(/insufficient data/i)

    forecast_display.update(observable)
    expect(forecast_display.display_message).to match(/rainy/i)
  end

  it "rising pressure is good weather" do
    observable = double(:observable)
    allow(observable).to receive(:pressure).and_return(27,27.5)

    forecast_display.update(observable)
    forecast_display.update(observable)

    expect(forecast_display.display_message).to match(/improving/i)
  end

  it "same pressure is same weather" do
    observable = double(:observable)
    allow(observable).to receive(:pressure).and_return(27.3,27.3)

    forecast_display.update(observable)
    forecast_display.update(observable)

    expect(forecast_display.display_message).to match(/same/i)
  end
end
