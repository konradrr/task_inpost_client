require "spec_helper"

describe InpostClient::Machine do
  subject { described_class.new stub_machine_raw }
  let(:attributes) { %w(id type services payment_type address status address_str location operating_hours) }
  # probably too cryptic
  # let(:attributes) { stub_machine_raw.keys }
  let(:stub_machine_raw) { { id: "ABC12A", location: [49.85558, 19.33405], location_description: "Stonka",
    location_description2: "Stonka", operating_hours: "24/7", payment_type: 2, services: ["parcel"],
    status: "Operating", type: 0 } }

  it "defines basic attributes using machine's keys" do
    stub_machine_raw.keys.each do |attribute|
      expect(subject).to respond_to attribute
    end
  end

  it "assings correct values to attributes" do
    stub_machine_raw.each do |attribute, value|
      expect(subject.send(attribute)).to eq value
    end
  end
end
