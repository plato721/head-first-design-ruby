require './lib/pizza'

class ClamPizza < Pizza
  def prepare
    @ingredients =[
      :dough,
      :sauce,
      :cheese,
      :clam
    ].map { |i| @ingredient_factory.send(i) }
  end
end
