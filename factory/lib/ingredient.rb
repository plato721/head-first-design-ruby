class Ingredient
  attr_reader :name

  def initialize(name:)
    @name = name
  end

  def ==(other)
    name == other.name
  end
end

class Cheese < Ingredient; end
class Sauce < Ingredient; end
class Dough < Ingredient; end
class Veggie < Ingredient; end
class Clam < Ingredient; end
class Pepperoni < Ingredient; end
