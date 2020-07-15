require './lib/menu_component'

class Menu < MenuComponent
  attr_reader :name, :description

  def initialize(name:, description:)
    @name = name
    @description = description
    @items = []
  end

  def print
    output = "#{name}: #{description}\n----------------"
    items.each do |item|
      output << item.print
      output << "\n"
    end
    output
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
    return false if !(n.is_a? Numeric)

    n >= 0 && n < items.length
  end
end
