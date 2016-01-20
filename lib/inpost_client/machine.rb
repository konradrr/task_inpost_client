# encoding: UTF-8
# require "httparty"

class InpostClient
  class Machine
    attr_reader :machine, :machines_collection

    def initialize id, machines
      @machines_collection = machines
      @machine = get_machine id, machines_collection
    end

    private

    def get_machine id, machines_collection
      machine = machines_collection.detect { |machine| machine["id"].downcase == id.downcase }

      if machine.nil?
        raise "Couldn't find Machine with 'id'=#{id}"
        nil
      else
        machine
      end
    end

    def machines_url endpoint_url
      @machines_url = endpoint_url + "/machines"
    end
  end
end
