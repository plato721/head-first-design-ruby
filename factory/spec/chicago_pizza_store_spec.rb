require './lib/chicago_pizza_store'
require './spec/pizza_store_examples'

describe ChicagoPizzaStore do
  it_behaves_like "a pizza store"

  it "makes pizzas in the chicago style" do
    pizza = subject.order_pizza("cheese")
    expect(pizza.name).to match(/chicago/i)
  end
end
