class Duck
  attr_accessor :fly_behavior, :quack_behavior

  def initialize
    raise NotImplementedError, "Inherit from this class, do not implement"
  end

  def perform_fly
    fly_behavior.fly
  end

  def perform_quack
    quack_behavior.quack
  end

  # #display is defined on Object, so using display_duck
  def display_duck
    raise NotImplementedError, "Define this in the subclass"
  end
end
