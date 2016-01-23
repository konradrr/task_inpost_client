require "inpost_client/machines_loader"
require "inpost_client/machine"

class InpostClient
  attr_reader :endpoint_url, :machines, :machine

  def initialize url=nil
    @endpoint_url = url || "https://api-pl.easypack24.net/v4"
    @machines = machine_loader @endpoint_url
  end

  def load_machines
    @machines = machine_loader @endpoint_url
  end

  def machine id
    @machines.find id
  end

  private

  def machine_loader url
    InpostClient::MachinesLoader.new url
  end
end
