require './lib/menu'
require './spec/shared_examples'

describe Menu do
  it_behaves_like "a menu component", Menu.new(
      name: "Pizzeria",
      description: "Popular among both sober and trashed members of society."
  )
end
