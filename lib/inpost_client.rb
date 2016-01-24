require 'inpost_client/railtie' if defined?(Rails)
require "inpost_client/machines_loader"
require "inpost_client/machine"
require "inpost_client/action_view/helpers"

class InpostClient
  attr_reader :inpost_url, :machines
  def initialize cache_time=nil, url="https://api-pl.easypack24.net/v4"
    @inpost_url = url
    @machines = machine_loader cache_time, @inpost_url
  end

  def machine id
    @machines.find id
  end

  private

  def machine_loader cache_time, url
    # set cache_time=24h if nil cache_time
    cache_time = cache_time == nil ? 86400 : cache_time

    if defined?(Rails) && cache_time > 0
      machines = Rails.cache.fetch("inpost_post_cache}", expires_in: cache_time.seconds) do
        InpostClient::MachinesLoader.new url
      end
    else
      machines = InpostClient::MachinesLoader.new url
    end
    machines
  end
end
