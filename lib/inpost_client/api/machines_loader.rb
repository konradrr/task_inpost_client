# encoding: UTF-8
require "httparty"

class InpostClient
  module API
    class MachinesLoader
      attr_accessor :endpoint_url, :machines

      def initialize url
        @endpoint_url = machines_url url
        @machines = get_machines endpoint_url
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
end
