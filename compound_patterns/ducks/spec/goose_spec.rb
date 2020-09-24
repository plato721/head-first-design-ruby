require './lib/goose'

describe Goose do
  it "is a Goose" do
    expect(Goose.new).to be_a Goose
  end

  it "honks" do
    goose = Goose.new
    expect(goose.honk).to be_a String
    expect(goose.honk.length > 0).to be_truthy
  end
end
