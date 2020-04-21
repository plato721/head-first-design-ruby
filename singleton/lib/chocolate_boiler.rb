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

  def drain
    @filled = false
  end

  def fill
    if !@filled
      @boiled = false
      @filled = true
    end
  end

  def boil
    return unless full? && !boiled?

    @boiled = true
    drain
  end

  def empty?
    !@filled
  end

  def full?
    @filled
  end

  def boiled?
    @boiled
  end
end
