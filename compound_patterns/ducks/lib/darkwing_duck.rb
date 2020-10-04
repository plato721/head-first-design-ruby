require './lib/observable'

class DarkwingDuck
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
    puts "dark... wing... duck!"
  end
end
