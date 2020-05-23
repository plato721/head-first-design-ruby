class TurkeyAdapter
  def initialize(turkey)
    @turkey = turkey
  end

  def fly
    [*1..5].map { turkey.fly }.join("\n")
  end

  def quack
    turkey.gobble
  end

  private
  attr_reader :turkey
end
