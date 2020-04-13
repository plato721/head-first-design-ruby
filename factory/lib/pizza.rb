class Pizza
  attr_accessor :name
  attr_reader :ingredients

  def initialize(ingredient_factory)
    @ingredient_factory = ingredient_factory
    @ingredients = []
  end

  def bake
    puts "Baking the pizza! Yeah, we bake them all the same way, strangely."
  end

  def cut
    puts "Cutting in the usual fashion. Safely. Both hands on the big banana blade."
  end

  def box
    puts "Boxing the pizza. Nothing like a cardboard paper cut."
  end
end