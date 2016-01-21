# encoding: UTF-8

class InpostClient
  class MachinesByType
    include Enumerable
    attr_reader :machines, :type

    def initialize type, machines
      @type = type
      @machines = get_by_type machines, type
    end

    def get_by_type machines, type
      machines = machines.find_all { |machine| machine["type"] == type }
      if machines.empty?
        raise "Couldn't find any Machine with 'type'=#{type}"
        []
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
  end
end
