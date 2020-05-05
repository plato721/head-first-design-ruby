class HotTubOffCommand
  def initialize(hot_tub)
    @hot_tub = hot_tub
  end

  def execute
    @hot_tub.bubbles_off
    @hot_tub.off
  end
end
