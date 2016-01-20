# encoding: UTF-8
require "spec_helper"

describe InpostClient::API::MachinesLoader do
  let(:machines_json) { InpostClient::Specs.load_machines_json }
  subject { described_class.new "http://enpoint-url.com" }

  it "has defined the machines url" do
    allow_any_instance_of(described_class).to receive(:get_machines).and_return machines_json
    expect(subject.send(:machines_url, "http://enpoint-url.com")).to eq "http://enpoint-url.com/machines"
  end

  it "loads the machines" do
    allow_any_instance_of(described_class).to receive(:get_machines).and_return machines_json
    expect(subject.machines.count).to eq 2
    expect(subject.machines[0]["id"]).to eq "ALK01A"
    expect(subject.machines[1]["id"]).to eq "ALL992"
  end
end
