module Powerable
  def off
    @on = false
  end

  def off?
    !@on
  end

  def on
    @on = true
  end

  def on?
    @on
  end
end
