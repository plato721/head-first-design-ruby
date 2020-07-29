require './lib/gumball_machine'

describe GumballMachine do
  context "happy path, quarter to gumball" do
    it "fulfills its purpose" do
      gm = described_class.new(50)
      initial_state = gm.state

      # we have gumballs, taking a quarter should be good
      expect(gm.insert_quarter).to be_truthy
      expect(gm.state).to_not eq(initial_state)

      # we have a quarter, turning the crank should be legal
      expect(gm.turn_crank).to be_truthy

      # plenty of gumballs should be left, expect to be ready
      # to take a quarter
      expect(gm.state).to eq(initial_state)

      # check if a gumball or two is gone, in anticipation of
      # the winner double-dispense requirement
      expect([49,48]).to include(gm.count)
    end
  end

  context "refilling the machine" do
    it "transitions from sold out to no quarter if a gumball added" do
      gm = described_class.new(0)
      expect(gm.state).to be_a(SoldOut)

      gm.fill(1)
      expect(gm.state).to be_a(NoQuarter)
    end

    it "is still sold out if 0 gumballs were added" do
      gm = described_class.new(0)
      gm.fill(0)
      expect(gm.state).to be_a(SoldOut)
    end
  end
end
