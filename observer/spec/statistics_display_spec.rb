require './spec/display_examples'
require './spec/observer_examples'
require './lib/statistics_display'

describe StatisticsDisplay do
  it_behaves_like "an observer"
  it_behaves_like "a display"

  let(:fake_observer){ double(:fake_observer, add_observer: nil) }
  let(:stat_display){ described_class.new(fake_observer) }

  it "will take any first temp as the new min" do
    observable = double(:observable, temperature: 250.3)

    stat_display.update(observable)

    expect(stat_display.min_temp).to be_within(0.001).of(250.3)
  end

  it "will take any first temp as the new max" do
    observable = double(:observable, temperature: -450.8)

    stat_display.update(observable)

    expect(stat_display.max_temp).to be_within(0.001).of(-450.8)
  end

  it "calculates average temperature" do
    observable = double(:observable)
    allow(observable).to receive(:temperature).and_return(100, 0, 0)

    stat_display.update(observable)
    expect(stat_display.average_temp).to be_within(0.001).of(100.0)

    stat_display.update(observable)
    expect(stat_display.average_temp).to be_within(0.001).of(50.0)

    stat_display.update(observable)
    expect(stat_display.average_temp).to be_within(0.001).of(33.33333)
  end

  it "#display_message has avg max min in succession" do
    observable = double(:observable)
    allow(observable).to receive(:temperature).and_return(43.1, 74.8)

    stat_display.update(observable)
    stat_display.update(observable)

    result = stat_display.display_message

    expect(result).to match(/avg.*max.*min.*58.95.*74.8.*43.1/i)
  end

end
