class StereoOffCommand
  def initialize(stereo)
    @stereo = stereo
  end

  def execute
    @stereo.volume = 0
    @stereo.unload_cd
    @stereo.off
  end
end
