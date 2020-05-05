require 'powerable.rb'

class Stereo
  include Powerable
  attr_reader :volume

  def initialize

  end

  def volume=(volume)
    @volume = volume
  end

  def load_cd
    @cd_loaded = true
  end

  def cd_loaded?
    @cd_loaded
  end

  def unload_cd
    @cd_loaded = false
  end
end
