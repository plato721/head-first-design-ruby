class Popper
  attr_reader :on

  def turn_on
    @on = true
  end

  def turn_off
    @on = false
  end

  def on?
    self.on
  end

  def off?
    !self.on
  end

  def pop
    puts "Popping the corn!"
  end
end
