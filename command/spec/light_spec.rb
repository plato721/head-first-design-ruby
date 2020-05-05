require './lib/light'
require './spec/powerable_examples'

describe Light do
  let(:subject){ Light.new("Garage") }
  it_behaves_like "a powerable"

  it "has a location" do
    expect(subject.location).to eql("Garage")
  end
end
