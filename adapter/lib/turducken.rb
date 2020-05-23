class Turducken
  def initialize(turkey_or_duck)
    @turkey_duck = turkey_or_duck
  end

  def fly
    turkey_duck.fly
  end

  def quack
    turkey_duck.respond_to?(:quack) ? turkey_duck.quack : turkey_duck.gobble
  end

  def gobble
    turkey_duck.respond_to?(:gobble) ? turkey_duck.gobble : turkey_duck.quack
  end

  private
  attr_reader :turkey_duck
end
