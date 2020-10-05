class Flock
  def initialize
    @ducks = []
  end

  def add(duck)
    @ducks << duck
  end

  def register_observer(observer)
    @ducks.each { |duck| duck.register_observer(observer) }
  end

  def quack
    @ducks.each(&:quack)
  end

  def to_s; self.class.to_s; end
end
