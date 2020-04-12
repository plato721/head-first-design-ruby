shared_examples "an ingredient factory" do
  it "has dough" do
    expect(subject.dough.is_a? Dough).to be_truthy
  end

  it "has sauce" do
    expect(subject.sauce.is_a? Sauce).to be_truthy
  end

  it "has cheese" do
    expect(subject.cheese.is_a? Cheese).to be_truthy
  end

  it "has veggies" do
    veggies = subject.veggies
    expect(veggies.all? { |v| v.is_a? Veggie }).to be_truthy
  end

  it "has clam" do
    expect(subject.clam.is_a? Clam).to be_truthy
  end
end
