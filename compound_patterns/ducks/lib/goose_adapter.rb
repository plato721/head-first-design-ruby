class GooseAdapter
  def initialize(goose)
    verify_goose(goose)
    @goose = goose
  end

  def verify_goose(goose)
    if !(goose.respond_to? :honk)
      raise ArgumentError, "Must respond to honk to use this adapter"
    end
  end

  def quack
    @goose.honk
  end
end
