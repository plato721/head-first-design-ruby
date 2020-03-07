RSpec.shared_examples "a display" do
  let(:subject){ described_class.new(double(:data_source).as_null_object) }
  # hey guess what? #display is defined on Object. who knew?
  it "#render `puts` something on the screen" do
    expect {
      subject.render
    }.to output(/.+/).to_stdout
  end
end
