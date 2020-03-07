class WeatherData
  attr_reader :temperature, :pressure, :humidity

  def initialize
    @observers = []
  end

  def add_observer(observer)
    @observers << observer
  end

  def remove_observer(observer)
    @observers.delete(observer)
  end

  def notify_observers
    observers.each { |observer| observer.update(self) }
  end

  def set_measurements(temperature:, pressure:, humidity:)
    @temperature = temperature if temperature
    @pressure = pressure if pressure
    @humidity = humidity if humidity
    measurements_changed if temperature || pressure || humidity
  end

  private
  attr_reader :observers

  def measurements_changed
    notify_observers
  end
end
