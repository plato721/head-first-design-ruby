require './lib/default_gumball_state'

class SoldOut
  include DefaultGumballState

  def initialize(gumball_machine)
    @gumball_machine = gumball_machine
  end

  def fill
    if @gumball_machine.count > 0
      @gumball_machine.state = @gumball_machine.no_quarter
    end
  end
end
