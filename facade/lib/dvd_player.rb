class DvdPlayer
  attr_reader :on, :movie

  def turn_on
    @on = true
  end

  def turn_off
    @on = false
  end

  def on?
    !!on
  end

  def off?
    !on
  end

  def play(movie)
    @movie = movie
    puts "Playing movie #{movie}"
  end

  def eject
    puts "Ejecting movie #{movie}"
    @movie = nil
  end
end
