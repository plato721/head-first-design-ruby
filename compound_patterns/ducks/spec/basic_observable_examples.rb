RSpec.shared_examples "a basic observable" do |test_subject|
  it "notifies the observer" do
    observer = double(:observer, update: nil)
    test_subject.register_observer(observer)
    test_subject.notify_observers
    expect(observer).to have_received(:update)
  end
end