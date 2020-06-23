require './lib/tea'
require './spec/caffeinated_examples_spec'

describe Tea do
  it "is the thing" do
    expect(described_class.new).to be_a(Tea)
  end

  it_behaves_like "a caffeinated beverage"

  # let's say that just for tea you get to choose whether or not you want
  # condiments
  context "condiment prompting" do
    it "adds condiments if yes" do
      allow_any_instance_of(Kernel).to receive(:gets).and_return("y\n")
      allow(subject).to receive(:add_condiments).and_call_original
      subject.prepare
      expect(subject).to have_received(:add_condiments)
    end

    it "does not add condiments if not yes" do
      allow_any_instance_of(Kernel).to receive(:gets).and_return("n\n")
      allow(subject).to receive(:add_condiments).and_call_original
      subject.prepare
      expect(subject).to_not have_received(:add_condiments)
    end
  end
end
