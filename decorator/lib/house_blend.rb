require './lib/beverage'

class HouseBlend
  include Beverage

  def base_cost; 0.89; end

  def description; "House Blend Coffee"; end
end
