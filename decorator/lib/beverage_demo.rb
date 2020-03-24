Dir['./lib/*.rb'].each do |file|
  require file
end

class BeverageDemo
  def build(beverage_and_extras)
    base_beverage = beverage_and_extras.shift.new
    beverage_and_extras.reduce(base_beverage) do |memo, next_beverage|
      next_beverage.new(beverage: memo)
    end
  end
end
