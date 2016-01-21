# encoding: UTF-8

class InpostClient
  class Machine
    def initialize id, machines
      @id = id
      @machine = get_machine id, machines
      InpostClient::Machine.create_helper_methods @machine
    end

    def self.create_helper_methods machine
      method_names = machine.keys.find_all{ |x| x.to_s[0] != '_' }

      method_names.each do |method_name|
        define_method(method_name) { @machine[method_name] }
      end
    end

    private

    def get_machine id, machines
      @machine = machines.detect { |x| x["id"].downcase == id.downcase }

      if @machine.nil?
        raise "Couldn't find Machine with 'id'=#{id}"
        nil
      else
        @machine
      end
    end
  end
end
