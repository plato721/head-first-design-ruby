module Beverage
  def initialize(beverage: nil)
    @beverage = beverage
  end

  def cost
    cost = base_cost + @beverage.cost if @beverage
    cost || base_cost
  end

  def base_description
    self.class.to_s
  end

  def description
    description = base_description + @beverage.description if @beverage
    description || base_description
  end
end
