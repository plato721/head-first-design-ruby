Dir['./lib/**/*.rb'].each{ |f| require f }

# Demo the composite pattern by displaying each of three restaurant's menus.
# One restaurant must have a nested menu.
# Then, display a vegetarian menu with all vegetarian options from each menu.
describe "Restaurant Demo" do
  seeder = Seeder.new
  root_menu = seeder.seed

  # waitress = Waitress.new(root_menu)
  # waitress.print_all
  # waitress.print_items("vegetarian")
end
