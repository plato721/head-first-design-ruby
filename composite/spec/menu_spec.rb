require './lib/menu'
require './spec/shared_examples'

describe Menu do
  it_behaves_like "a menu component", Menu.new(
      name: "Cheese pizza",
      description: "Everybody eats eat, nobody loves it."
  )
end
