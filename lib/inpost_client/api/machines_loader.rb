# encoding: UTF-8
require "httparty"

class InpostClient
  module API
    class MachinesLoader
      attr_reader :machines

      def initialize endpoint_url
        url = machines_url endpoint_url
        @machines = get_machines url
      end

      private

      def machines_url endpoint_url
        @machines_url = endpoint_url + "/machines"
      end

      def get_machines machines_url
        inpost_json = HTTParty.get machines_url
        inpost_json["_embedded"]["machines"]
      end
    end
  end
end
