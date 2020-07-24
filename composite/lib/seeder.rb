require 'yaml'

class Seeder
  def seed
    to_seed = YAML.load_file('./lib/menus.yml')
    MenuComponent.from_yaml(to_seed)
  end
end
