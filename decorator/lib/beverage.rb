class Beverage
  def initialize
    # Honestly not sure if I would ever do this in ruby...
    raise StandardError, "This is an abstract class?"
  end

  def description
    @description || "Unknown description"
  end
end
