require './lib/observable'

class QuackCounter
  attr_reader :observable

  @@quack_count = 0

  def self.quack_count
    @@quack_count
  end

  def initialize(duck:, observable: nil)
    @duck = duck
    @observable = observable || Observable.new(self)
  end

  def notify_observers
    observable.notify_observers
  end

  def quack
    @@quack_count += 1
    @duck.quack
  end
end
