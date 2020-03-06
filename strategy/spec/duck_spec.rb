require 'spec_helper'
require './lib/duck'

class DemoDuck < Duck
  def initialize; end
end

describe Duck do
  it "is an abstract class" do
    expect{
      (Duck.new)
    }.to raise_error(NotImplementedError)
  end

  describe "#display_duck - " do
    it "is an abstract method" do
      bad_duck = DemoDuck.new

      expect(bad_duck.respond_to? :display_duck).to be_truthy
      expect{
        bad_duck.display_duck
      }.to raise_error(NotImplementedError)
    end
  end
end
