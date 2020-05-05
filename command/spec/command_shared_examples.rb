RSpec.shared_examples "a command" do
  it "responds to execute" do
    expect{
      subject.command
    }.to_not raise_error(NoMethodError)
  end
end
