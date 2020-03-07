class ForecastDisplay
  attr_reader :current_pressure, :last_pressure

  def initialize(data_source)
    data_source.add_observer(self)
  end

  def update(data_source)
    pressure = data_source.pressure
    return unless pressure.is_a? Numeric

    @last_pressure = @current_pressure
    @current_pressure = pressure

    render
  end

  def display_message
    message = "Forecast: "
    message += if last_pressure.nil?
      "Insufficient data"
    elsif current_pressure < last_pressure
      "Watch out for cooler, rainy weather!"
    elsif current_pressure > last_pressure
      "Improving weather on the way!"
    else #=> current_pressure == last_pressure
      "More of the same"
    end
  end

  def render
    puts display_message
  end
end
