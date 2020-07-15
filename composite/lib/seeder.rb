require 'yaml'

class Seeder
  attr_reader :menu_components

  def initialize
    @menu_components = []
  end

  def seed
    to_seed = YAML.load_file('./lib/menus.yml')
    to_seed.each { |record_hash| load(record_hash) }
    get_menu("Full Menu")
  end

  def load(record_hash)
    loader = loader_for(record_hash)
    menu_component = loader.from_yaml(record_hash)
    menu_components << menu_component
    add_to_menu(record_hash["menu"], menu_component)
  end

  def loader_for(record_hash)
    return record_hash["type"] == "menu" ? Menu : MenuItem
  end

  def add_to_menu(menu_name, menu_component)
    return if !menu_name

    menu = get_menu(menu_name)
    menu.add(menu_component)
  end

  def get_menu(name)
    menu_components.find{ |menu| menu.name == name }
  end
end
