class InpostClient
  class Address
    def initialize address_raw
      create_attributes address_raw
    end

    private

    def create_attributes address_raw
      attribute_names = address_raw.keys

      attribute_names.each do |attribute_name|
        instance_variable_set "@#{attribute_name}", address_raw[attribute_name]
         InpostClient::Address.class_eval{attr_reader attribute_name}
      end
    end
  end
end
