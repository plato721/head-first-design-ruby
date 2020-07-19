require './lib/menu_component'

class MenuItem < MenuComponent
  attr_reader :name, :description, :price, :vegetarian

  def self.from_yaml(record_hash, menu=nil)
    new_item = self.new(
        name: record_hash["name"],
        description: record_hash["description"],
        price: record_hash["price"],
        vegetarian: !!record_hash["vegetarian"]
    )
    menu.add(new_item) if menu
    new_item
  end

  def initialize(name:, description:, price:, vegetarian:)
    @name = name
    @description = description
    @price = price
    @vegetarian = vegetarian
  end

  def vegetarian?
    !!vegetarian
  end

  def print
    "   #{display_name}, #{price}\n" +
        "      -- #{description}\n"
  end

  private

  def display_name
    name + (vegetarian? ? "(v)" : "")
  end
end
