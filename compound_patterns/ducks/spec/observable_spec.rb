require './lib/observable'

RSpec.describe Observable do
  it "takes an observer" do
    observable = Observable.new(double(:duck))
    expect{
      observable.register_observer(double(:observer))
    }.to_not raise_error
  end

  it "notifies the observers" do
    duck = double(:duck)
    observers = [*1..3].map { double(:observer, update: nil) }
    observable = described_class.new(duck)
    observers.each { |observer| observable.register_observer(observer) }

    observable.notify_observers

    observers.each do |observer|
      expect(observer).to have_received(:update).with(duck).exactly(1).times
    end
  end
end
