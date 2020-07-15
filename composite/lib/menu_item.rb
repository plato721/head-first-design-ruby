require './lib/menu_component'

class MenuItem < MenuComponent
  attr_reader :name, :description, :price, :vegetarian

  def self.from_yaml(record_hash)
    new(
        name: record_hash.first.first,
        description: record_hash["description"],
        price: record_hash["price"],
        vegetarian: !!record_hash["vegetarian"]
    )
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
    "#{name}".ljust(15, '.') + "#{price}".rjust(5, '.') +
        ("\n-" * 20) +
        "#{description}"
  end
end
