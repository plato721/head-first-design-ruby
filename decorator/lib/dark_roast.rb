require './lib/beverage'

class DarkRoast
  include Beverage

  def base_cost; 0.99; end

  def description; "Dark roast"; end
end
