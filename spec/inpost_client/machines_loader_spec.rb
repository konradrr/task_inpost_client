# encoding: UTF-8
require "spec_helper"

describe InpostClient::MachinesLoader do
  let(:machines_json) { InpostClient::Specs.load_machines_json }
  let(:machines) { machines_json.to_a }
  let(:url) { "http://endpoint-url.com" }
  subject { described_class.new url }

  it "has defined the machines url" do
    allow_any_instance_of(described_class).to receive(:get_machines).and_return machines_json
    expect(subject.send(:machines_url, url)).to eq "http://endpoint-url.com/machines"
  end

  it "loads the machines" do
    allow_any_instance_of(described_class).to receive(:get_machines).and_return machines_json
    expect(subject.machines.count).to eq 2
    expect(subject.machines[0]["id"]).to eq "ALK01A"
    expect(subject.machines[1]["id"]).to eq "ALL992"
  end

  it "gets machines by type" do
    allow_any_instance_of(described_class).to receive(:get_machines).and_return machines_json
    expect(subject.by_type(1).count).to eq 1
    expect(subject.by_type(1)[0]["id"]).to eq "ALL992"
  end

  context "no machine with the type" do
    it "raises an error" do
      allow_any_instance_of(described_class).to receive(:get_machines).and_return machines_json
      expect{subject.by_type(10)}.to raise_error RuntimeError, "Couldn't find any Machine with 'type'=10"
    end
  end
end
