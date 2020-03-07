class CurrentConditionsDisplay
  attr_reader :temperature, :pressure, :humidity

  def initialize(data_source)
    data_source.add_observer(self)
  end

  def update(data_source)
    temperature = data_source.temperature
    pressure = data_source.pressure
    humidity = data_source.humidity

    return unless [temperature, pressure, humidity].all? do |data|
      data.is_a? Numeric
    end # really should probably check individually. but this is a toy app....

    @temperature = temperature
    @pressure = pressure
    @humidity = humidity

    render
  end

  def to_percent(decimal)
    "#{decimal * 100}%" rescue ""
  end

  def display_message
    "Temperature: #{temperature} Humidity: #{to_percent(humidity)}\
 Pressure: #{pressure}"
  end

  def render
    puts display_message
  end
end
