require 'rspec'
Dir['./lib/**/*'].each { |f| require f }

RSpec.describe "Head First Design Patterns - Ruby Command Pattern" do
  it "is a party" do
    hot_tub = HotTub.new
    hot_tub_on = HotTubOnCommand.new(hot_tub)
    hot_tub_off = HotTubOffCommand.new(hot_tub)

    stereo = Stereo.new
    stereo_on = StereoOnCommand.new(stereo)
    stereo_off = StereoOffCommand.new(stereo)

    porch_light = Light.new("kitchen")
    porch_light_on = LightOnCommand.new(porch_light)
    porch_light_off = LightOffCommand.new(porch_light)

    party_light = Light.new("den")
    party_light_on = LightOnCommand.new(party_light)
    party_light_off = LightOffCommand.new(party_light)

    party_on_command = MacroCommand.new([hot_tub_on, stereo_on, porch_light_on, party_light_on])
    party_off_command = MacroCommand.new([hot_tub_off, stereo_off, porch_light_off, party_light_off])

    # turn off to be sure, even though we'd expect it to be off already
    party_off_command.execute
    expect(hot_tub).to be_off
    expect(porch_light).to be_off
    expect(stereo).to be_off
    expect(party_light).to be_off

    # turn 'er on
    party_on_command.execute
    expect(party_light).to be_on
    expect(porch_light).to be_on

    expect(hot_tub).to be_on
    expect(hot_tub.bubbles?).to be_truthy

    expect(stereo).to be_on
    expect(stereo.volume > 10).to be_truthy
    expect(stereo.cd_loaded?).to be_truthy

    # turn 'er off
    party_off_command.execute
    expect(hot_tub).to be_off
    expect(porch_light).to be_off
    expect(stereo).to be_off
    expect(party_light).to be_off
  end
end
