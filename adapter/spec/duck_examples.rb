RSpec.shared_examples "a duck" do |duck|
  let(:subject){ duck }

  it "flies" do
    expect(duck.fly).to be_a(String)
    expect(duck.fly.length > 0).to be_truthy
  end

  it "quacks" do
    expect(duck.quack).to be_a(String)
    expect(duck.quack.length > 0).to be_truthy
  end
end
