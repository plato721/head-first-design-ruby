shared_examples "a pizza store" do
  let(:all_the_pizzas){ ["cheese", "pepperoni"] }

  describe "ordering a pizza" do
    it "has all the pizzas" do
      all_the_pizzas.each do |type|
        pizza = subject.order_pizza(type)
        expect(pizza.name).to match(/#{type}/i)
      end
    end
  end
end
