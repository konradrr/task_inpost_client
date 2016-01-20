# encoding: UTF-8

class InpostClient
  class MachinesByType
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
  end
end
