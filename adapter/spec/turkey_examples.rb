RSpec.shared_examples "a turkey" do |turkey|
  let(:subject){ turkey }

  it "flies" do
    expect(turkey.fly).to be_a(String)
    expect(turkey.fly.length > 0).to be_truthy
  end

  it "gobbles" do
    expect(turkey.gobble).to be_a(String)
    expect(turkey.gobble.length > 0).to be_truthy
  end
end
