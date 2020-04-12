require './lib/ingredient'

class ChicagoIngredientFactory
  attr_reader :dough, :sauce, :cheese, :veggies, :clam

  def initialize
    @sauce = Sauce.new name: "Plum tomato sauce"
    @dough = Dough.new name: "Thick crust dough"
    @cheese = Cheese.new name: "Mozzarella cheese"
    @veggies = ["Green pepper", "Onion", "Portabello mushroom"].map do |name|
      Veggie.new name: name
    end
    @clam = Clam.new name: "Fine canned clams"
  end
end
