RSpec.shared_examples "a caffeinated beverage" do
  it "is a caffeinated beverage" do
    expect(subject).to be_a(CaffeinatedBeverage)
  end

  it "prepares" do
    allow(subject).to receive(:condiments_wanted?){ true }
    expect{
      subject.prepare
    }.to_not raise_error
  end

  it "boils" do
    expect{
      subject.boil
    }.to_not raise_error
  end

  it "brews" do
    expect{
      subject.brew
    }.to_not raise_error
  end

  it "pours" do
    expect{
      subject.pour
    }.to_not raise_error
  end

  it "adds_condiments" do
    expect{
      subject.add_condiments
    }.to_not raise_error
  end

  context "add condiments as hook" do
    it "does not add condiments if not wanted" do
      allow(subject).to receive(:condiments_wanted?){ false }
      allow(subject).to receive(:add_condiments).and_call_original
      subject.prepare
      expect(subject).to_not have_received(:add_condiments)
    end

    it "adds condiments if wanted" do
      allow(subject).to receive(:condiments_wanted?){ true }
      allow(subject).to receive(:add_condiments).and_call_original
      subject.prepare
      expect(subject).to have_received(:add_condiments)
    end
  end
end
