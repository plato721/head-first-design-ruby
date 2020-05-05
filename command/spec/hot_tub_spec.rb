require './lib/hot_tub.rb'
require './spec/powerable_examples.rb'

describe HotTub do
  it_behaves_like "a powerable"

  context "bubbles" do
    it "Yes, I appear to be writing a test about a fake hot tub and its bubbles" do
      subject.bubbles
      expect(subject.bubbles?).to be_truthy

      subject.bubbles_off
      expect(subject.bubbles?).to be_falsey
    end
  end
end
