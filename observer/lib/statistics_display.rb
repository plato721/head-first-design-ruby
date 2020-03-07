class StatisticsDisplay
  attr_reader :max_temp, :min_temp, :temp_sum, :num_readings

  def initialize(data_source)
    initialize_stats
    @data_source = data_source
    data_source.add_observer(self)
  end

  def update(data_source)
    temp = data_source.temperature
    return unless temp.is_a? Numeric

    @temp_sum += temp
    @num_readings += 1

    @max_temp = temp if temp > max_temp
    @min_temp = temp if temp < min_temp
  end

  def average_temp
    temp_sum / num_readings
  end

  def display_message
    "Avg/Max/Min temperature = #{average_temp} / #{max_temp} / #{min_temp}"
  end

  def render
    puts display_message
  end

  private
  def initialize_stats
    @max_temp = -1/0.0 # => negative infinity
    @min_temp = 1/0.0  # => infinity
    @temp_sum = 0.0
    @num_readings = 0
  end
end
