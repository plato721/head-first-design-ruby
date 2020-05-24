class Screen
  attr_reader :screen_level

  def initialize
    @screen_level = "up"
  end

  def lower
    @screen_level = "down"
  end

  def raise
    @screen_level = "up"
  end

  def down?
    screen_level == "down"
  end

  def up?
    screen_level == "up"
  end
end
