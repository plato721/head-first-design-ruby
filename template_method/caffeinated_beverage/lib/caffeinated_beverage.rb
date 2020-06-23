class CaffeinatedBeverage
  def initialize
    raise "This is what they call an abstract class. Inherit, don't create."
  end

  def prepare
    boil
    brew
    pour
    add_condiments if condiments_wanted?
  end

  def boil
    puts "Boiling!"
  end

  def brew
    raise "Must implement in subclass"
  end

  def pour
    puts "Pouring!"
  end

  def add_condiments
    raise "Must implement in subclass"
  end

  def condiments_wanted?
    true
  end
end
