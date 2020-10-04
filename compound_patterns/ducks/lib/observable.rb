class Observable
  def initialize(duck)
    @observers = []
    @duck = duck
  end

  def register_observer observer
    observers << observer
  end

  def notify_observers
    observers.each do |observer|
      observer.update(duck)
    end
  end

  private
  attr_accessor :observers
  attr_reader :duck
end
