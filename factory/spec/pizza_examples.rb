shared_examples "a pizza" do |pizza|
  it "can be cut" do
    expect(pizza).to respond_to(:cut)
  end

  it "can be baked" do
    expect(pizza).to respond_to(:bake)
  end

  it "can be boxed" do
    expect(pizza).to respond_to(:box)
  end

  it "has a settable name" do
    pizza.name = "Moses"
    expect(pizza.name).to eql("Moses")
  end

  it "defines a prepare" do
    expect(pizza).to respond_to(:prepare)
  end

  it "has ingredients" do
    pizza.prepare
    expect(pizza.ingredients.length > 0).to be_truthy
    expect(pizza.ingredients.all? do |i|
      i.is_a? Ingredient
    end).to be_truthy
  end
end
