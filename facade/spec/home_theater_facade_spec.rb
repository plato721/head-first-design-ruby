Dir['./lib/**/*.rb'].each { |f| require f }

RSpec.describe HomeTheaterFacade do
  let(:components) do
    tuner = Tuner.new
    dvd = DvdPlayer.new
    cd = CdPlayer.new
    {tuner: tuner,
     cd: cd,
     projector: Projector.new,
     screen: Screen.new,
     lights: TheaterLights.new,
     popper: Popper.new,
     dvd: dvd,
     amp: Amplifier.new(tuner: tuner, dvd: dvd, cd: cd)}
  end

  def facade(custom_components=nil)
    if !custom_components
      @facade ||= described_class.new(components)
    else
      described_class.new(custom_components)
    end
  end

  it "creates a facade" do
    expect(facade).to be_a(HomeTheaterFacade)
  end

  context "#watch_movie" do
    it "turns on the popper" do
      expect(facade.popper).to be_off
      facade.watch_movie("Goldfinger")

      expect(facade.popper).to be_on
    end

    it "pops the corn" do
      popper = double(:popper, pop: nil, turn_on: nil)
      allow(popper).to receive(:pop)

      enhanced_components = components.merge(popper: popper)
      facade = described_class.new(enhanced_components)

      facade.watch_movie("Balderdash")

      expect(popper).to have_received(:pop)
    end

    it "dims lights to 10" do
      facade.lights.dim(100)
      expect(facade.lights.dim_level).to eql(100)
      facade.watch_movie("Goldfinger")

      expect(facade.lights.dim_level).to eql(10)
    end

    it "lowers the screen" do
      expect(facade.screen).to_not be_down
      facade.watch_movie("Something")
      expect(facade.screen).to be_down
    end

    it "turns the projector on" do
      expect(facade.projector).to be_off
      facade.watch_movie("Anything")
      expect(facade.projector).to be_on
    end

    it "puts dvd in widescreen" do
      expect(facade.projector.mode).to_not eq(:wide_screen)
      facade.watch_movie("something")
      expect(facade.projector.mode).to eq(:wide_screen)
    end

    it "turns the amp on" do
      expect(facade.amp).to be_off
      facade.watch_movie("ugh")
      expect(facade.amp).to be_on
    end

    it "puts the amp in surround sound mode" do
      expect(facade.amp.surround?).to be_falsey
      facade.watch_movie("Starry night")
      expect(facade.amp.surround?).to be_truthy
    end

    it "sets amp volume to 5" do
      expect(facade.amp.volume).to eq(0)
      facade.watch_movie("Isn't that a painting")
      expect(facade.amp.volume).to eq(5)
    end

    it "turns dvd on" do
      expect(facade.amp).to_not be_on
      facade.watch_movie("Knights of the triangle")
      expect(facade.amp).to be_on
    end

    it "plays movie on dvd" do
      expect(facade.dvd.movie).to_not match /dark/i
      facade.watch_movie("Something something dark side")
      expect(facade.dvd.movie).to eq("Something something dark side")
    end
  end
end
