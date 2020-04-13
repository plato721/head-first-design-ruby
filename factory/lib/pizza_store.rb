require './lib/cheese_pizza'
require './lib/pepperoni_pizza'
require './lib/clam_pizza'
require './lib/veggie_pizza'

class PizzaStore
  def order_pizza(type)
    pizza = create_pizza(type.downcase)
    pizza.prepare
    pizza.bake
    pizza.cut
    pizza.box

    pizza
  end

  def pizza_type_with_class
    {
      cheese: CheesePizza,
      pepperoni: PepperoniPizza,
      veggie: VeggiePizza,
      clam: ClamPizza
    }
  end
end
