class Flock
  def initialize
    @ducks = []
  end

  def add(duck)
    @ducks << duck
  end

  def quack
    @ducks.each(&:quack)
  end
end
