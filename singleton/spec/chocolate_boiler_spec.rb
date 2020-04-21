require './lib/chocolate_boiler'

describe ChocolateBoiler do

  describe "is a singleton: " do
    it "provides an instance via #instance" do
      expect(described_class.instance).to be_a(ChocolateBoiler)
    end

    it "does not expose its new" do
      expect{
        described_class.new
      }.to raise_error(StandardError)
    end

    it "doesn't provide more than the single instance" do
      instance1 = described_class.instance
      instance2 = described_class.instance
      instance3 = described_class.instance

      expect(instance1).to eq(instance2)
      expect(instance2).to eq(instance3)
    end
  end

  it "is initially empty and not boiled" do
    expect(described_class.instance).to be_empty
    expect(described_class.instance).to_not be_boiled
  end

  it "can be filled and will not be boiled upon filling" do
    boiler = described_class.instance
    boiler.fill

    expect(boiler).to be_full
    expect(boiler).to_not be_boiled
  end

  it "will drain upon boiling" do
    boiler = described_class.instance
    boiler.fill
    boiler.boil
    expect(boiler).to be_empty
    expect(boiler).to be_boiled
  end

  describe "won't boil unless full and unboiled" do
    let(:boiler){ described_class.instance }
    it "- does nothing if empty and unboiled" do
      boiler.instance_variable_set(:@filled, false)
      boiler.instance_variable_set(:@boiled, false)

      boiler.boil
      expect(boiler).to be_empty
      expect(boiler).to_not be_boiled
    end

    it "- does nothing if full and boiled" do
      boiler.instance_variable_set(:@filled, true)
      boiler.instance_variable_set(:@boiled, true)

      boiler.boil
      expect(boiler).to be_full
      expect(boiler).to be_boiled
    end

    it "- does nothing if empty and boiled" do
      boiler.instance_variable_set(:@filled, false)
      boiler.instance_variable_set(:@boiled, true)

      boiler.boil
      expect(boiler).to_not be_full
      expect(boiler).to be_boiled
    end
  end
end
