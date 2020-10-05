require './lib/zoologist'

RSpec.describe Zoologist do
  context "#update" do
    it "is updatable" do
      zoologist = described_class.new

      expect{
        zoologist.update(double(:duck))
      }.to_not raise_error
    end
  end
end
