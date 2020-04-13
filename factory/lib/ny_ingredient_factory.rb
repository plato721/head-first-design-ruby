require './lib/ingredient'

class NYIngredientFactory
  attr_reader :dough, :sauce, :cheese, :veggies, :clam, :pepperoni

  def initialize
    @sauce = Sauce.new name: "Marinara tomato sauce"
    @dough = Dough.new name: "Thin crust dough"
    @cheese = Cheese.new name: "Reggiano cheese"
    @veggies = ["Green pepper", "Onion", "Portabello mushroom"].map do |name|
      Veggie.new name: name
    end
    @clam = Clam.new name: "Fresh clams"
    @pepperoni = Pepperoni.new name: "Sliced pepperoni"
  end
end
