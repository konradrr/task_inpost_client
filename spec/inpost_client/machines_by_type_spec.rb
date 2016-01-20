# encoding: UTF-8
require "spec_helper"

describe InpostClient::MachinesByType do
  let(:machines_array) { InpostClient::Specs.load_machines_json.to_a }
  let(:existing_type) { described_class.new(1, machines_array).machines }
  let(:no_type) { described_class.new(10, machines_array).machines }

  it "gets machines by type" do
    expect(existing_type.count).to eq 1
    expect(existing_type[0]["id"]).to eq "ALL992"
  end

  context "no machine with the type" do
    it "raises an error" do
      expect{no_type}.to raise_error RuntimeError, "Couldn't find any Machine with 'type'=10"
    end
  end
end
