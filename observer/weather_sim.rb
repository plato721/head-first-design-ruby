Dir['./lib/*.rb'].each { |f| require f}

weather_data = WeatherData.new

display_classes = [CurrentConditionsDisplay, ForecastDisplay, HeatIndexDisplay,
  StatisticsDisplay]

display_classes.each { |klass| klass.new(weather_data) }

weather_data.set_measurements(temperature: 80.0, humidity: 0.65, pressure: 30.4)
weather_data.set_measurements(temperature: 82.0, humidity: 0.70, pressure: 29.2)
weather_data.set_measurements(temperature: 78.0, humidity: 0.90, pressure: 29.2)
