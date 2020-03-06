class FlyBehavior
  def initialize
    raise NotImplementedError, "Inherit from this class and implement all its methods"
  end

  def fly
    raise NotImplementedError, "Define in subclass."
  end
end
