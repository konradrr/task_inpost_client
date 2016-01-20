# encoding: UTF-8
require "inpost_client/version"
require "inpost_client/api/machines_loader"
require "inpost_client/api/machine"
require "inpost_client/machine"

class InpostClient
  attr_reader :endpoint_url

  def initialize url=nil
    @endpoint_url = url || inpost_url
  end

  def machines url=endpoint_url
    @machines ||= InpostClient::API::MachinesLoader.new(url).machines
  end

  def machine id, machines_collection=machines
    @machine = InpostClient::Machine.new(id, machines_collection).machine
  end

  private

  def inpost_url
    "https://api-pl.easypack24.net/v4"
  end
end
