class ChocolateBoiler
  @@instance

  private_class_method :new

  def self.instance
    @@instance ||= new
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
