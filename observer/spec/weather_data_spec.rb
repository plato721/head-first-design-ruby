require './spec/observer_examples'
require './lib/weather_data'

RSpec.describe WeatherData do
  it_behaves_like "a subject"

  context "observable state - " do
    [:temperature, :pressure, :humidity].each do |state|
      it "has #{state}" do
        expect(subject).to respond_to(state)
      end
    end
  end

  context "updating state" do
    it "has a weather station sim entry point" do
      data = { temperature: 67.7,
        humidity: 0.08,
        pressure: 29.94 }

      subject.set_measurements(data)

      expect(subject.temperature).to eq(67.7)
      expect(subject.humidity).to eq(0.08)
      expect(subject.pressure).to eq(29.94)
    end

    it "notifies observers with changes" do
      data = { temperature: -13.1,
        humidity: 0.73,
        pressure: 30.12 }

      observer = double(:observer)
      allow(observer).to receive(:update)
      subject.add_observer(observer)
      subject.set_measurements(data)

      expect(observer).to have_received(:update).with(subject)

      expect(subject.temperature).to eq(-13.1)
      expect(subject.humidity).to eq(0.73)
      expect(subject.pressure).to eq(30.12)
    end
  end
end
