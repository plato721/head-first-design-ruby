require './lib/caffeinated_beverage'

class Tea < CaffeinatedBeverage
  def initialize; end

  def add_condiments
    puts "Lemon and honey? I guess is how people drink this vile shit?"
  end

  def brew
    puts "Tea bags."
  end
end
