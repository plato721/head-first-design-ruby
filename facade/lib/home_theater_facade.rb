class HomeTheaterFacade
  attr_reader :popper, :tuner, :screen, :cd, :lights, :dvd, :projector, :amp

  def initialize(amp:, tuner:, screen:, popper:, cd:, lights:, dvd:, projector:)
    @popper = popper
    @tuner = tuner
    @screen = screen
    @cd = cd
    @lights = lights
    @dvd = dvd
    @projector = projector
    @amp = amp
  end

  def watch_movie(movie)
    puts("Get ready to watch a movie...")
    popper.turn_on
    popper.pop
    lights.dim(10)
    screen.lower
    projector.turn_on
    projector.wide_screen_mode
    amp.turn_on
    amp.set_surround_sound
    amp.set_volume(5)
    dvd.turn_on
    dvd.play(movie)
  end
end
