class Duck
  attr_reader :name, :weight

  def initialize(name, weight)
    @name = name
    @weight = weight
  end

  def <=>(other)
    return -1 if weight < other.weight
    return 1 if weight > other.weight
    0
  end
end
