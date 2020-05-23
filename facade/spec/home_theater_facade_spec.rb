Dir['./lib/**/*.rb'].each { |f| require f }

RSpec.describe HomeTheaterFacade do
  let(:facade) do
    tuner = Tuner.new
    cd = CdPlayer.new
    projector = Projector.new
    screen = Screen.new
    lights = TheaterLights.new
    popper = Popper.new
    dvd = DvdPlayer.new
    amp = Amplifier.new(tuner: tuner, dvd: dvd, cd: cd)

    described_class.new(
        amp: amp, tuner: tuner, screen: screen, popper: popper,
        cd: cd, lights: lights, dvd: dvd, projector: projector
    )
  end

  it "creates a facade" do
    expect(facade).to be_a(HomeTheaterFacade)
  end
end
