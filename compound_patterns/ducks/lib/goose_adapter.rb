class GooseAdapter
  def initialize(goose)
    verify_goose(goose)
    @goose = goose
    @observable = Observable.new(self)
  end

  def verify_goose(goose)
    if !(goose.respond_to? :honk)
      raise ArgumentError, "Must respond to honk to use this adapter"
    end
  end

  def register_observer(observer)
    @observable.register_observer(observer)
  end

  def notify_observers
    @observable.notify_observers
  end

  def quack
    # not an observable duck, because does not really quack
    # (not notifying observers here)
    @goose.honk
  end

  def to_s
    @goose.to_s
  end
end
