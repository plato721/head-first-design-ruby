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

  context "double dispense winner" do
    it "dispenses two gumballs around 10% of the time" do
      cranks = 0
      dispenses = 0

      gm = described_class.new(10_000)
      5000.times do
        initial_balls = gm.count

        gm.state = gm.has_quarter # house money baby!
        gm.turn_crank

        cranks += 1
        dispenses += (initial_balls - gm.count)
      end

      double_dispense_percentage = (dispenses - cranks) / cranks.to_f
      expect(double_dispense_percentage).to be_within(0.01).of(0.1)
    end

    it "won't dispense under zero" do # which means we must have 2, so that we can dispense 2
      gm = described_class.new(1)
      expect(gm.insert_quarter).to be_falsey

      gm = described_class.new(2)
      gm.insert_quarter
      gm.turn_crank

      expect(gm.insert_quarter).to be_falsey
    end
  end
end
