RSpec.shared_examples "a caffeinated beverage" do
  it "is a caffeinated beverage" do
    expect(subject).to be_a(CaffeinatedBeverage)
  end

  it "prepares" do
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
end
