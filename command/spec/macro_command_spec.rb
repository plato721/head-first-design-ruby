require './lib/macro_command'
require './spec/command_shared_examples'

describe MacroCommand do
  it_behaves_like "a command"

  it "calls all the commands" do
    lawnmower_command = double :lawnmower_command
    weedeater_command = double :weedeater_command
    discoball_command = double :discoball_command

    commands = [
        lawnmower_command,
        weedeater_command,
        discoball_command
    ]
    commands.each { |c| allow(c).to receive(:execute) }

    macro = described_class.new(commands)

    macro.execute
    commands.each do |command|
      expect(command).to have_received(:execute)
    end
  end
end
