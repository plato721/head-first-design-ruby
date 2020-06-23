require './lib/caffeinated_beverage'

class Coffee < CaffeinatedBeverage
  def initialize; end

  def add_condiments
    puts "Adding milk and sugar, as is the Dunkin way."
  end

  def brew
    puts "Coffee grounds. Not just for 80s cocaine movies."
  end
end
