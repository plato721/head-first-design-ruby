class QuackBehavior
  def initialize
    raise NotImplementedError, "Inherit from this class and implement all its methods"
  end

  def quack
    raise NotImplementedError, "Define this in subclasses"
  end
end
