# encoding: UTF-8
require "spec_helper"

class InpostClient
  class Specs
    class << self
      def load_machines_json
        file = File.open("spec/fixtures/machines.json", "r")
        JSON::parse file.read
      end
    end
  end
end
