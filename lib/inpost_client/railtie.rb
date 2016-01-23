class InpostClient
  class Railtie < ::Rails::Railtie
    initializer "inpost_client.action_view" do
      ActiveSupport.on_load :action_view do
        require "inpost_client/action_view/helpers"
        include InpostClient::ActionView::Helpers
      end
    end
  end
end
