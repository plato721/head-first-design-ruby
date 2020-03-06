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
