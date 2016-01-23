require "spec_helper"

describe InpostClient do
  subject { described_class.new url }
  let(:url) { "http://endpoint_url.com" }
  let(:machines_json) { InpostClient::Specs.load_machines_json }
  let(:machines_loader) { described_class::MachinesLoader.new(url) }
  let(:machines_loader_class) { machines_loader_class }

  before :each do
    allow_any_instance_of(described_class::MachinesLoader).to receive(:get_machines_json).and_return machines_json
  end

  it "has defined the endpoint url" do
    expect(subject.endpoint_url).to eq url
    expect(described_class.new.endpoint_url).to eq "https://api-pl.easypack24.net/v4"
  end

  it "gets machines" do
    expect(subject.machines).to be_an described_class::MachinesLoader
  end

  it "loads machines" do
    expect(described_class::MachinesLoader).to receive(:new).twice
    # twice because of before each filter
    subject.load_machines
  end

  it "get machine by id" do
    expect(subject.machines).to receive(:find).with('abc')
    subject.machine "abc"
  end
end
