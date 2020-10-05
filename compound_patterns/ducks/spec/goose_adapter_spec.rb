require './spec/basic_observable_examples'
require './spec/duck_examples'
require './lib/goose_adapter'
require 'ostruct'

describe GooseAdapter do
  it_behaves_like "a duck", described_class.new(OpenStruct.new(honk: "anything"))
  it_behaves_like "a basic observable", described_class.new(OpenStruct.new(honk: "anything"))

  it "takes a honker" do
    goose = double(:goose, honk: nil)

    expect{
      described_class.new(goose)
    }.to_not raise_error
  end

  it "errors if honker doesn't honk" do
    impostor = double(:not_really_a_goose)

    expect{
      described_class.new(impostor)
    }.to raise_error(ArgumentError)
  end

  it "maps quack to honk" do
    goose = double(:goose)
    allow(goose).to receive(:honk){ "we won't look at a return value" }
    adapter = described_class.new(goose)

    adapter.quack

    expect(goose).to have_received(:honk)
  end
end
