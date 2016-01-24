require "spec_helper"

describe InpostClient do
  subject { described_class.new nil, url }
  let(:url) { "http://endpoint_url.com" }
  let(:machines_json) { InpostClient::Specs.load_machines_json }
  let(:machines_loader_class) { described_class::MachinesLoader }

  before :each do
    allow_any_instance_of(machines_loader_class).to receive(:get_machines_json).and_return machines_json
  end

  it "has defined the Inpost url" do
    expect(subject.inpost_url).to eq url
    expect(described_class.new.inpost_url).to eq "https://api-pl.easypack24.net/v4"
  end

  it "gets machines" do
    expect(subject.machines).to be_an machines_loader_class
  end

  it "get machine by id" do
    expect(subject.machines).to receive(:find).with('abc')
    subject.machine "abc"
  end
end
