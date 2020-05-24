class Popper
  attr_reader :on

  def turn_on
    @on = true
  end

  def on?
    self.on
  end

  def off?
    !self.on
  end

  def pop
    "Popping the corn!"
  end
end
