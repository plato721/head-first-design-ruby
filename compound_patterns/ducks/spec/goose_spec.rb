require './lib/goose'

describe Goose do
  it "is a Goose" do
    expect(Goose.new).to be_a Goose
  end

  it "honks" do
    goose = Goose.new
    expect{
      goose.honk
    }.to_not raise_error
  end
end
