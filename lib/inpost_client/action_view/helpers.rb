class InpostClient
  module ActionView
    module Helpers
      def select_inpost_machine machines, name="machine_id", type=nil
        if type
          machines = machines.by_type type
        else
          machines
        end
        select_tag name, options_from_collection_for_select(machines, :id, :id)
      end
    end
  end
end
