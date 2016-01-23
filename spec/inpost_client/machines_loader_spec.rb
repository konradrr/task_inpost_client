require "spec_helper"

describe InpostClient::MachinesLoader do
  let(:machines_json) { InpostClient::Specs.load_machines_json }
  let(:url) { "http://endpoint-url.com" }
  subject { described_class.new url }

  before :each do
    allow_any_instance_of(described_class).to receive(:get_machines_json).and_return machines_json
    # 1st machine's id = ALK01A
    # 2nd machine's id = ALL992
  end

  it "has defined the machines url" do
    expect(subject.send(:machines_url, url)).to eq "http://endpoint-url.com/machines"
  end

  it "loads the machines" do
    expect(subject.machines.count).to eq 2
    expect(subject.machines[0].id).to eq "ALK01A"
    expect(subject.machines[1].id).to eq "ALL992"
  end

  describe "find machine" do
    it "gets machine by given id" do
      expect(subject.find("ALK01A").id).to eq "ALK01A"
    end

    context "no machine with the ID" do
      it "raises an error" do
        expect{subject.find("fake-ID")}.to raise_error RuntimeError, "Couldn't find Machine with 'id'=fake-ID"
      end
    end
  end

  describe "machines by type" do
    it "gets machines by given type" do
      expect(subject.by_type(1).count).to eq 1
      expect(subject.by_type(1)[0].id).to eq "ALL992"
    end

    context "no machine with the type" do
      it "raises an error" do
        expect{subject.by_type(10)}.to raise_error RuntimeError, "Couldn't find any Machine with 'type'=10"
      end
    end
  end

  it "responds to enumerable's methods" do
    expect(subject).to respond_to :each, :count
  end

end
