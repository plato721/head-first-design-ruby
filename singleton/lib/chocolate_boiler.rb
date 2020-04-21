class ChocolateBoiler
  @@instance_mutex = Mutex.new
  @@instance = nil

  private_class_method :new

  def self.instance
    @@instance ||= @@instance_mutex.synchronize do
      @@instance ||= new
    end
  end

  def initialize
    @filled = false
    @boiled = false
  end

  def empty?
    !@filled
  end

  def drain
    @filled = false
  end

  def fill
    @filled = true
  end

  def full?
    @filled
  end

  def boiled?
    @boiled
  end

  def boil
    if !boiled? && full?
      @filled = false
      @boiled = true
    end
  end
end