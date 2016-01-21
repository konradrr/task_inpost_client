# encoding: UTF-8
require "httparty"
require "inpost_client/machine"

class InpostClient
  class MachinesLoader
    include Enumerable

    attr_reader :endpoint_url
    attr_accessor :machines

    def initialize url
      @endpoint_url = machines_url url
      @machines = get_machines endpoint_url
    end

    def machine id
      InpostClient::Machine.new id, @machines
    end

    def method_missing method, *args, &block
      machines.send method, *args, &block
    end

    def respond_to_missing? method, include_private=false
      machines.respond_to?(method, include_private) || super
    end

    private

    def machines_url url
      @endpoint_url = url + "/machines"
    end

    def get_machines url
      inpost_json = HTTParty.get url
      inpost_json["_embedded"]["machines"]
    end
  end
end
