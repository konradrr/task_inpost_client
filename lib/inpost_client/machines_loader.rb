require "httparty"
require "inpost_client/machine"

class InpostClient
  class MachinesLoader
    include Enumerable
    attr_reader :machines

    def initialize url
      @machines = []
      api_machines_url = machines_url url
      machines_hash = get_machines_json api_machines_url
      instantiate_machines machines_hash
    end

    def find id
      machine = machines.detect { |machine| machine.id.downcase == id.downcase }

      if machine.nil?
        raise "Couldn't find Machine with 'id'=#{id}"
      else
        machine
      end
    end

    def by_type type
      machines = @machines.find_all { |machine| machine.type == type }
      if machines.empty?
        raise "Couldn't find any Machine with 'type'=#{type}"
      else
        machines
      end
    end

    def method_missing method, *args, &block
      machines.send method, *args, &block
    end

    def respond_to_missing? method, include_private=false
      machines.respond_to?(method, include_private) || super
    end

    private

    def get_machines_json url
      inpost_json = HTTParty.get url
      machines_raw_hash = inpost_json["_embedded"]["machines"]
    end

    def instantiate_machines machines_raw_hash
      machines_raw_hash.each do |machine_hash|
        @machines << InpostClient::Machine.new(machine_hash)
      end
    end

    def machines_url url
      url + "/machines"
    end
  end
end
