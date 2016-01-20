# encoding: UTF-8
require "inpost_client/version"
require "inpost_client/api/machines_loader"
require "inpost_client/machine"
require "inpost_client/machines_by_type"

class InpostClient
  attr_reader :endpoint_url, :machines, :machine

  def initialize url=nil
    @endpoint_url = url || inpost_url
    @machines = InpostClient::API::MachinesLoader.new(endpoint_url).machines
  end

  def machines_by_type type, machines_collection=machines
    InpostClient::MachinesByType.new(type, machines_collection).machines
  end

  def machine id, machines_collection=machines
    machine = InpostClient::Machine.new(id, machines_collection).machine
  end

  private

  def inpost_url
    "https://api-pl.easypack24.net/v4"
  end
end
