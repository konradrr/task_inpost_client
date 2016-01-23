class InpostClient
  class Machine
    def initialize machine_raw
      create_attributes machine_raw
    end

    private

    def create_attributes machine_raw
      attribute_names = machine_raw.keys.find_all{ |x| x.to_s[0] != '_' }

      attribute_names.each do |attribute_name|
        instance_variable_set "@#{attribute_name}", machine_raw[attribute_name]
         InpostClient::Machine.class_eval{attr_reader attribute_name}
      end
    end
  end
end
