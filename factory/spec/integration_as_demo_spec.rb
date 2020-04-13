Dir['./lib/**/*.rb'].each { |f| require f }

describe "Pizza Store Ruby Factory Demo" do
  let(:chicago_store){ ChicagoPizzaStore.new }
  let(:ny_store){ NYPizzaStore.new }

  it "creates a chicago-style pepperoni pizza" do
    pizza = chicago_store.order_pizza("pepperoni")

    expect(pizza.is_a? Pizza).to be_truthy
    [Dough, Sauce, Cheese].each do |basic_pizza_thing|
      expect(pizza.ingredients.map(&:class)).to include(basic_pizza_thing)
    end

    dough = pizza.ingredients.find { |i| i.is_a? Dough }
    sauce = pizza.ingredients.find { |i| i.is_a? Sauce }
    cheese = pizza.ingredients.find { |i| i.is_a? Cheese }

    expect(dough.name).to match(/thick/i)
    expect(sauce.name).to match(/plum/i)
    expect(cheese.name).to match(/mozzarella/i)
  end

  it "creates a NY-style veggie pizza" do
    pizza = ny_store.order_pizza("pepperoni")

    expect(pizza.is_a? Pizza).to be_truthy
    [Dough, Sauce, Cheese].each do |basic_pizza_thing|
      expect(pizza.ingredients.map(&:class)).to include(basic_pizza_thing)
    end

    dough = pizza.ingredients.find { |i| i.is_a? Dough }
    sauce = pizza.ingredients.find { |i| i.is_a? Sauce }
    cheese = pizza.ingredients.find { |i| i.is_a? Cheese }

    expect(dough.name).to match(/thin/i)
    expect(sauce.name).to match(/marinara/i)
    expect(cheese.name).to match(/reggiano/i)
  end
end
