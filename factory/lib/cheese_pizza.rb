require './lib/pizza'

class CheesePizza < Pizza
  def prepare
    @ingredients =[
      :dough,
      :sauce,
      :cheese
    ].map { |i| @ingredient_factory.send(i) }
  end
end
