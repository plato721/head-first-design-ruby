
Dir['./lib/**/*.rb'].each { |f| require f }

mallard = MallardDuck.new
mallard.perform_quack
mallard.perform_fly
