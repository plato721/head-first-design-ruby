class TheaterLights
  attr_reader :dim_level

  def dim(level)
    puts("Dimming lights to #{level}")
    @dim_level = level
  end
end
