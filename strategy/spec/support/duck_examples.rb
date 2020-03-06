RSpec.shared_examples "a duck" do
  it "is a duck" do
    expect(subject).to be_a(Duck)
  end

  [:perform_fly, :perform_quack, :display_duck].each do |behavior|
    it "does #{behavior} like a duck" do
      expect{
        subject.send(behavior)
      }.to_not raise_error
    end
  end
end
