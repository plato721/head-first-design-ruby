class HotTubOnCommand
  def initialize(hot_tub)
    @hot_tub = hot_tub
  end

  def execute
    @hot_tub.on
    @hot_tub.bubbles
  end
end