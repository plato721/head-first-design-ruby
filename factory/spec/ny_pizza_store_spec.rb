require './lib/ny_pizza_store'
require './spec/pizza_store_examples'

describe NYPizzaStore do
  it_behaves_like "a pizza store"

  it "makes pizzas in the new york style" do
    pizza = subject.order_pizza("cheese")
    expect(pizza.name).to match(/ny/i)
  end
end
