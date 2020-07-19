require './lib/menu_component'

class Menu < MenuComponent
  attr_reader :name, :description

  def self.from_yaml(record_hash, menu=nil)
    new_menu = self.new(
        name: record_hash["name"],
        description: record_hash["description"],
    )
    menu.add(new_menu) if menu
    record_hash["items"].each do |raw_menu_component|
      MenuComponent.from_yaml(raw_menu_component, new_menu)
    end
    new_menu
  end

  def initialize(name:, description:)
    @name = name
    @description = description
    @items = []
  end

  def print
    output = ["\n#{name}: #{description}\n-------------------------\n"]
    items.each_with_object(output) do |item, output|
      output << item.print
    end.join
  end

  def add(item)
    @items << item
  end

  def remove(item)
    @items.delete(item)
  end

  def get_child(n)
    @items[n] if child_exist?(n)
  end

  def enumerable
    items.clone
  end

  private
  attr_reader :items

  def child_exist?(n)
    return false unless n.is_a?(Numeric)

    n >= 0 && n < items.length
  end
end
