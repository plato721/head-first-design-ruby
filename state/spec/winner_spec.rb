require './lib/winner'

describe Winner do
  it "dispenses two gumballs" do
    gm = GumballMachine.new(50)
    allow(gm).to receive(:release_gumball)

    winner = described_class.new(gm)
    winner.dispense

    expect(gm).to have_received(:release_gumball).exactly(2).times
  end
end
