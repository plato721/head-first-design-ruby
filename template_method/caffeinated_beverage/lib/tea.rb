require './lib/caffeinated_beverage'

class Tea < CaffeinatedBeverage
  def initialize; end

  def add_condiments
    puts "Lemon and honey? I guess is how people drink this vile shit?"
  end

  def condiments_wanted?
    puts "Would you like lemon and honey to help you choke that down?"
    input = gets.chomp
    input =~ /^y/i
  end

  def brew
    puts "Tea bags."
  end
end
