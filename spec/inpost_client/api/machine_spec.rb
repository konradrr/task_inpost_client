# encoding: UTF-8
require "spec_helper"

describe InpostClient::Machine do
  let(:machines_array) { InpostClient::Specs.load_machines_json.to_a }
  let(:url) { "http://endpoint-url.com" }
  let(:alk_machine) { described_class.new "ALK01A", machines_array }
  let(:no_machine) { described_class.new "fake-ID", machines_array }

  context "existing machine with the ID" do
    it "loads the machine by their ID" do
      expect(alk_machine.machine["id"]).to eq "ALK01A"
      expect(alk_machine.machine["status"]).to eq "Operating"
    end
  end

  context "no machine with the ID" do
    it "raises an error" do
      expect{no_machine}.to raise_error RuntimeError, "Couldn't find Machine with 'id'=fake-ID"
    end
  end
end
