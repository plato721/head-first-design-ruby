require './lib/stereo'
require './spec/powerable_examples'

describe Stereo do
  it_behaves_like "a powerable"

  context "volume" do
    it "can be changed and checked" do
      subject.volume = 11
      expect(subject.volume).to eq(11)

      subject.volume = 7
      expect(subject.volume).to eq(7)
    end
  end

  context "cd setting" do
    it "can be loaded" do
      subject.load_cd
      expect(subject.cd_loaded?).to be_truthy

      subject.unload_cd
      expect(subject.cd_loaded?).to be_falsey
    end
  end
end
