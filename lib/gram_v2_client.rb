require 'gram_v2_client/configuration'
require 'gram_v2_client/base'
require 'gram_v2_client/account'
require 'gram_v2_client/group'
require 'gram_v2_client/role'
require 'gram_v2_client/version'

class GramV2Client
  def self.init
    proxy = GramV2Client.configuration.proxy
    GramV2Client::Base.connection_options[:proxy] = proxy unless proxy.nil?
    GramV2Client::Base.connection do |connection|
      connection.faraday::basic_auth(GramV2Client.configuration.user, GramV2Client.configuration.password)
    end
  end

end