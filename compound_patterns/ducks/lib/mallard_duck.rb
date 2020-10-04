require './lib/observable'

class MallardDuck
  attr_reader :observable

  def initialize(observable: nil)
    @observable = observable
    @observable ||= Observable.new(self)
  end

  def notify_observers
    observable.notify_observers
  end

  def quack
    notify_observers
    puts "Vanilla quack"
  end
end
