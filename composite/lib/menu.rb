require './lib/menu_component'

class Menu < MenuComponent
  attr_reader :name, :description

  def initialize(name:, description:)
    @name = name
    @description = description
  end

  def print
    "#{name}: #{description}\n----------------"
  end
end
