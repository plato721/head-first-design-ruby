RSpec.shared_examples "a menu component"  do |component|
  let(:subject){ component }
  it "has the output methods" do
    expect(subject.name).to be_a(String)
    expect(subject.description).to be_a(String)
    expect(subject.print).to include(subject.name)
    expect(subject.print).to include(subject.description)
  end

  it "responds to the root methods" do
    [:add, :remove, :get_child, :create_iterator].each do |method|
      expect(subject).to respond_to(method)
    end
  end

  it "responds to the leaf methods" do
    [:price, :vegetarian?, :price].each do |method|
      expect(subject).to respond_to(method)
    end
  end
end
