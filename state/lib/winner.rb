require './lib/sold'
class Winner < Sold
  def dispense
    @gumball_machine.release_gumball
    super
  end
end
