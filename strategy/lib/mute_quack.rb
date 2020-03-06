require './lib/quack_behavior'

class MuteQuack < QuackBehavior
  def initialize; end

  def quack
    puts "<< silence >>"
  end
end
