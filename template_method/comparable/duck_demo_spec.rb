require './duck'

RSpec.describe Duck do
  it "sorts by weight" do
    daffy = Duck.new("Daffy", 7)
    cranky = Duck.new("Cranky", 9)
    beefy = Duck.new("Beefy", 3.2)
    pied = Duck.new("Pi", 3.14)

    ducks = [daffy, cranky, beefy, pied]
    expect(ducks.sort).to eq([pied, beefy, daffy, cranky])
  end
end
