require './lib/default_gumball_state'

class HasQuarter
  include DefaultGumballState

  attr_reader :gumball_machine

  def initialize(gumball_machine)
    @gumball_machine = gumball_machine
  end

  def winner?
    [*1..10].shuffle.shuffle.sample == 7
  end

  def turn_crank
    gumball_machine.state = winner? ? gumball_machine.winner : gumball_machine.sold
  end

  def eject_quarter
    gumball_machine.state = gumball_machine.no_quarter
  end
end
