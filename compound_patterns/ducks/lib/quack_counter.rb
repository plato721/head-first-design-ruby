require './lib/observable'

class QuackCounter
  attr_reader :observable

  @@quack_count = 0

  def self.quack_count
    @@quack_count
  end

  def initialize(duck)
    @duck = duck
    @observable = Observable.new(self)
  end

  def notify_observers
    observable.notify_observers
  end

  def register_observer(observer)
    @duck.register_observer(observer)
  end

  def quack
    @@quack_count += 1
    @duck.quack
  end

  def to_s; @duck.to_s; end
end
