class Projector
  attr_reader :on, :mode

  def initialize
    @on = false
  end

  def turn_on
    puts "Turning projector on"
    @on = true
  end

  def turn_off
    puts "Turning projector off"
    @on = false
  end

  def on?
    on
  end

  def off?
    !on
  end

  def wide_screen_mode
    @mode = :wide_screen
  end

  def tv_mode
    @mode = :tv
  end
end
