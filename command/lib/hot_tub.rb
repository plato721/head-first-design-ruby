require './lib/powerable'

class HotTub
  include Powerable

  def bubbles
    @bubbles = true
  end

  def bubbles_off
    @bubbles = false
  end

  def bubbles?
    @bubbles
  end
end
