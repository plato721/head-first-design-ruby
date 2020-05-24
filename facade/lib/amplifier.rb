class Amplifier
  attr_reader :on, :dvd, :cd, :tuner, :surround, :volume

  def initialize(tuner:, dvd:, cd:)
    @on = false
    @tuner = tuner
    @dvd = dvd
    @cd = cd
  end

  def turn_on
    @on = true
  end

  def turn_off
    @on = false
  end

  def on?
    @on
  end

  def off?
    !@on
  end

  def set_surround_sound
    @surround = true
  end

  def surround?
    !!surround
  end

  def volume
    @volume ||= 0
  end

  def set_volume(volume)
    @volume = volume
  end
end
