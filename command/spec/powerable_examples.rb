RSpec.shared_examples "a powerable" do
  context "power" do
    it "can be turned off and on" do
      subject.off
      expect(subject).to be_off

      subject.on
      expect(subject).to be_on
    end
  end
end
