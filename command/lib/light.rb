require './lib/powerable'

class Light
  include Powerable

  def initialize(location)
    @location = location
  end

  def location
    @location
  end
end
