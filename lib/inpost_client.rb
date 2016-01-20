# encoding: UTF-8
require "inpost_client/version"
require "inpost_client/api/machines_loader"

class InpostClient
  attr_reader :endpoint_url, :machines

  def initialize url=inpost_url
    @endpoint_url = url
  end

  def get_machines
    @machines = InpostClient::API::MachinesLoader.new(endpoint_url).machines
  end

  private

  def inpost_url
    "https://api-pl.easypack24.net/v4"
  end
end
