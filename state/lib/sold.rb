require './lib/default_gumball_state'

class Sold
  include DefaultGumballState

  def initialize(gumball_machine)
    @gumball_machine = gumball_machine
  end

  def dispense
    @gumball_machine.release_gumball
    @gumball_machine.state = if @gumball_machine.count > 0
                               @gumball_machine.no_quarter
                             else
                               @gumball_machine.sold_out
                             end
  end
end
