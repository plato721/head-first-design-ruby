RSpec.shared_examples "a duck" do |test_duck|
  it "quacks" do
    result = test_duck.quack

    expect(result).to be_a String
    expect(result.length > 0).to be_truthy
  end
end
