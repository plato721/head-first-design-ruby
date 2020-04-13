require './lib/pizza'

class PepperoniPizza < Pizza
  def prepare
    @ingredients =[
      :dough,
      :sauce,
      :cheese,
      :pepperoni
    ].map { |i| @ingredient_factory.send(i) }
  end
end
