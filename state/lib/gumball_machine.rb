require './lib/sold'
require './lib/no_quarter'
require './lib/has_quarter'
require './lib/sold_out'

class GumballMachine
  attr_reader :count, :no_quarter, :has_quarter, :sold, :sold_out
  attr_accessor :state

  def initialize(gumball_count)
    @count = gumball_count
    initialize_states
    set_initial_state
  end

  def initialize_states
    @sold_out = SoldOut.new(self)
    @no_quarter = NoQuarter.new(self)
    @has_quarter = HasQuarter.new(self)
    @sold = Sold.new(self)
  end

  def set_initial_state
    @state = count > 0 ? no_quarter : sold_out
  end

  def insert_quarter
    @state.insert_quarter
  end

  def eject_quarter
    @state.eject_quarter
  end

  def turn_crank
    dispense if @state.turn_crank
  end

  def dispense
    @state.dispense
  end

  def release_gumball
    @count -= 1
  end
end
