require './lib/observable'

class RubberDuck
  attr_reader :observable

  def initialize(observable: nil)
    @observable = observable
    @observable ||= Observable.new(self)
  end

  def notify_observers
    observable.notify_observers
  end

  def register_observer(observer)
    observable.register_observer(observer)
  end

  def quack
    notify_observers
    puts "Squeek!"
  end
end
