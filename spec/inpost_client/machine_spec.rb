# encoding: UTF-8
require "spec_helper"

describe InpostClient::Machine do
  let(:machines_array) { InpostClient::Specs.load_machines_json.to_a }
  let(:alk_machine) { described_class.new "ALK01A", machines_array }
  let(:no_machine) { described_class.new "fake-ID", machines_array }
  let(:methods) { %w(id type services payment_type address status address_str location operating_hours) }

  it "loads the machine by their ID" do
    expect(alk_machine.id).to eq "ALK01A"
    expect(alk_machine.status).to eq "Operating"
  end

  context "no machine with the ID" do
    it "raises an error" do
      expect{no_machine}.to raise_error RuntimeError, "Couldn't find Machine with 'id'=fake-ID"
    end
  end

  it "defines basic methods using machine's keys" do
    methods.each do |method|
      expect(alk_machine).to respond_to method
    end
  end
end
