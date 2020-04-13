require './lib/ny_ingredient_factory'
require './lib/pizza_store'

class NYPizzaStore < PizzaStore
  def initialize
    @ingredient_factory = NYIngredientFactory.new
  end

  def create_pizza(type)
    pizza = pizza_type_with_class[type.to_sym]
      .new(@ingredient_factory)
    pizza.name = "NY style #{type} pizza"
    pizza
  end
end
