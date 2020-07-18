Dir['./lib/**/*.rb'].each{ |f| require f }

# Demo the composite pattern by displaying each of three restaurant's menus.
# One restaurant must have a nested menu.
# Then, display a vegetarian menu with all vegetarian options from each menu.
describe "Restaurant Demo" do
  seeder = Seeder.new
  root_menu = seeder.seed

  fh = File.open('./spec/java_demo_output.txt')
  expected = fh.read

  waitress = Waitress.new(root_menu)
  full_menu = waitress.print_all
  vegetarian_menu = waitress.print_items(->(item){ item.vegetarian? })
  combined = full_menu + "\n\n" + vegetarian_menu

  expect(combined).to eq(expected)
end
