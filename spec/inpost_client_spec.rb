require "spec_helper"

describe InpostClient do
  subject { described_class.new url }
  let(:url) { "http://endpoint_url.com" }
  let(:machines_json) { InpostClient::Specs.load_machines_json }
  let(:machines_loader) { described_class::API::MachinesLoader.new(url) }
  let(:machines_loader_class) { machines_loader_class }

  it "has a version number" do
    expect(InpostClient::VERSION).not_to be nil
  end

  it "has defined the endpoint url" do
    expect(subject.endpoint_url).to eq url
    expect(described_class.new.endpoint_url).to eq "https://api-pl.easypack24.net/v4"
  end

  it "fetch array of machines" do
    allow_any_instance_of(described_class::API::MachinesLoader).to receive(:get_machines).and_return machines_json
    expect(subject.machines).to be_an Array
  end
end
