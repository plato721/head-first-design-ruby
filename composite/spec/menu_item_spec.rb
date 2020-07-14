require './lib/menu_item'
require './spec/shared_examples'

describe MenuItem do
  before(:all) do
    @valid_attributes = {name: "Cheese pizza",
                           description: "Everybody eats eat, nobody loves it.",
                           price: 7.99,
                           vegetarian: true}
    end

  it_behaves_like "a menu component", MenuItem.new({name: "Cheese pizza",
                                                    description: "Everybody eats eat, nobody loves it.",
                                                    price: 7.99,
                                                    vegetarian: true})

  it "knows if it is vegetarian" do
    not_veggie = described_class.new(@valid_attributes.merge({vegetarian: false}))
    expect(not_veggie).to_not be_vegetarian

    veggie = described_class.new(@valid_attributes.merge({vegetarian: true}))
    expect(veggie).to be_vegetarian
  end

  it "has a price" do
    niner = described_class.new(@valid_attributes.merge({price: 5.57}))
    expect(niner.price).to be_within(0.001).of(5.57)
  end
end
