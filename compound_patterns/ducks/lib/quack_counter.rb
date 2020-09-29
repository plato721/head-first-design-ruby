class QuackCounter
  @@quack_count = 0

  def self.quack_count
    @@quack_count
  end

  def initialize(duck)
    @duck = duck
  end

  def quack
    @@quack_count += 1
    @duck.quack
  end
end
