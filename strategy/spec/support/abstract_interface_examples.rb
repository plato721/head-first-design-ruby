RSpec.shared_examples "an abstract interface" do
  it "cannot be instantiated" do
    expect{
      described_class.new
    }.to raise_error(NotImplementedError)
  end

  it "cannot define concrete methods" do
    demo_class = Class.new(described_class) do
      def initialize; end
    end

    empty_implementer = demo_class.new

    described_class.instance_methods(false).each do |interface_method|
      expect{
        empty_implementer.send(interface_method)
      }.to raise_error(NotImplementedError), "All methods should explode, but ##{interface_method} was defined."
    end
  end
end
