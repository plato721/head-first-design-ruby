class Duck
  attr_reader :name, :weight

  def initialize(name, weight)
    @name = name
    @weight = weight
  end

  def <=>(other)
    weight <=> other.weight
  end
end
