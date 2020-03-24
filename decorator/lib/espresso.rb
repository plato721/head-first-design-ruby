require './lib/beverage'

class Espresso
  include Beverage

  def base_cost; 1.99; end
end
