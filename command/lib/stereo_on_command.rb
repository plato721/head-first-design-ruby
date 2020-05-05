class StereoOnCommand
  def initialize(stereo)
    @stereo = stereo
  end

  def execute
    @stereo.on
    @stereo.load_cd
    @stereo.volume = 11
  end
end
