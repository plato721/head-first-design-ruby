Dir['./lib/**/*.rb'].each { |f| require f }
require './spec/duck_examples.rb'
require './spec/turkey_examples.rb'

RSpec.describe "Adapter Demo" do
  duck = MallardDuck.new
  turkey = WildTurkey.new
  turkey_adapter = TurkeyAdapter.new(turkey)

  duckey = Turducken.new(duck)
  turduck = Turducken.new(turkey)

  it_behaves_like "a duck", duck
  it_behaves_like "a turkey", turkey

  it_behaves_like "a duck", turkey_adapter

  it_behaves_like "a duck", duckey
  it_behaves_like "a turkey", duckey

  it_behaves_like "a duck", turduck
  it_behaves_like "a turkey", turduck
end
