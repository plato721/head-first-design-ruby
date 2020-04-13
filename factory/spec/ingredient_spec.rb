require './lib/ingredient'

describe Ingredient do
  it "has a name" do
    name = "Canned clams"
    ingredient = described_class.new(name: name)
    expect(ingredient.name).to eql("Canned clams")
  end

  describe "equality" do
    it "is equal to another with the same name" do
      name = "Sliced pepperoni"

      i1 = described_class.new(name: name)
      i2 = described_class.new(name: name)

      expect(i1 == i2).to be_truthy
    end

    it "is not equal to another with a different name" do
      i1 = described_class.new(name: "molasses")
      i2 = described_class.new(name: "sweet ginger")

      expect(i1 == i2).to be_falsey
    end
  end
end
