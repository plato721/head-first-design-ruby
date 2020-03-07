class HeatIndexDisplay
  attr_reader :heat_index

  def initialize(data_source)
    data_source.add_observer(self)
  end

  def update(data_source)
    temp = data_source.temperature
    humidity = data_source.humidity

    return unless [temp, humidity].all? { |data| data.is_a? Numeric }

    @heat_index = compute_heat_index(temp, humidity)
    render
  end

  def compute_heat_index(t, rh)
    # this is wrong, but i think the sample code's was also or i wouldn't
    # have started down this rabit hole
    -42.379 + 2.04901523 * t + 10.14333127 * rh - 0.22475541 * t * rh -
    0.00683783 * t**2 - 0.05481717 * rh**2 + 0.00122874 * t**2 * rh +
    0.00085282 * t * rh**2 - 0.00000199 * t**2 * rh**2
  end

  def display_message
    "Heat index is #{heat_index}"
  end

  def render
    puts display_message
  end
end
