RSpec.shared_examples "an observer" do
  it "accepts an #update message" do
    observable = double(:observable).as_null_object

    observer = described_class.new(observable)

    expect(observer).to respond_to(:update)

    # This requires the observer to be able to handle null responses to its
    # pulls. Which, maybe we want and maybe we don't. But for anyone who
    # may actually read this code, that's what's goin on.
    expect{
      observer.update(observable)
    }.to_not raise_error
  end
end

RSpec.shared_examples "a subject" do
  let(:observable){ subject } # to avoid confusion
  let(:observer){ double(:observer) }

  before do
    observable.add_observer(observer)
  end

  it "notifies the observers" do
    allow(observer).to receive(:update)

    observable.notify_observers

    expect(observer).to have_received(:update)
  end

  it "removes observers and doesn't bother them anymore" do
    allow(observer).to receive(:update)

    observable.remove_observer(observer)
    observable.notify_observers

    expect(observer).to_not have_received(:update)
  end
end
