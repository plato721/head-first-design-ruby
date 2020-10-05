require './lib/observable'

class DuckCall
  attr_reader :observable

  def initialize
    @observable = Observable.new(self)
  end

  def notify_observers
    observable.notify_observers
  end

  def register_observer(observer)
    observable.register_observer(observer)
  end

  def quack
    notify_observers
    puts "Kwak"
  end
end
