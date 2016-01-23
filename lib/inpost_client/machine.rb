class InpostClient
  class Machine
    def initialize machine_raw
      create_attributes machine_raw
    end

    private

    def create_attributes machine_raw
      method_names = machine_raw.keys.find_all{ |x| x.to_s[0] != '_' }

      method_names.each do |method_name|
        instance_variable_set "@#{method_name}", machine_raw[method_name]
         InpostClient::Machine.class_eval{attr_reader method_name}
      end
    end
  end
end
