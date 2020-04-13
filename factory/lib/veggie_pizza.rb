require './lib/pizza'

class VeggiePizza < Pizza
  def prepare
    @ingredients =[
      :dough,
      :sauce,
      :cheese,
      :veggies
    ].map { |i| @ingredient_factory.send(i) }
  end
end
