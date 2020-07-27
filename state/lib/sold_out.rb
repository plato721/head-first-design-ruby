require './lib/default_gumball_state'

class SoldOut
  include DefaultGumballState

  def initialize(gumball_machine)
    @gumball_machine = gumball_machine
  end
end
