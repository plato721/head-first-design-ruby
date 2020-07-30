require './lib/default_gumball_state'

class NoQuarter
  include DefaultGumballState

  attr_reader :gumball_machine

  def initialize(gumball_machine)
    @gumball_machine = gumball_machine
  end

  def insert_quarter
    gumball_machine.state = gumball_machine.has_quarter
  end
end
