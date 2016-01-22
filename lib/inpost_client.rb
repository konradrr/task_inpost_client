# encoding: UTF-8
require "inpost_client/version"
require "inpost_client/machines_loader"
require "inpost_client/machine"

class InpostClient
  attr_reader :endpoint_url, :machines, :machine

  def initialize url=nil
    @endpoint_url = url || inpost_url
    @machines = InpostClient::MachinesLoader.new(endpoint_url)

  end

  def machines_by_type type
    @machines.by_type type
  end

  def machine id
    @machines.machine id
  end

  def inpost_url
    "https://api-pl.easypack24.net/v4"
  end
end
