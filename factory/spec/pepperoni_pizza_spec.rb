require './spec/pizza_examples'
require './lib/pepperoni_pizza'
require './lib/ny_ingredient_factory'

describe PepperoniPizza do
  it_behaves_like "a pizza", described_class.new(NYIngredientFactory.new)

  it "has cheese, sauce, and dough" do
    pizza = described_class.new(NYIngredientFactory.new)
    pizza.prepare

    expected = [
      Sauce.new(name: "any"),
      Dough.new(name: "any"),
      Cheese.new(name: "any"),
      Pepperoni.new(name: "great")
    ].map(&:class)
    expect(pizza.ingredients.map(&:class)).to match_array(expected)
  end
end
