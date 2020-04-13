require './lib/chicago_ingredient_factory'
require './lib/pizza_store'

class ChicagoPizzaStore < PizzaStore
  def initialize
    @ingredient_factory = ChicagoIngredientFactory.new
  end

  def create_pizza(type)
    pizza = pizza_type_with_class[type.to_sym]
      .new(@ingredient_factory)
    pizza.name = "Chicago style #{type} pizza"
    pizza
  end
end
