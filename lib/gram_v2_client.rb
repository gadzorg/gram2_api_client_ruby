require 'active_resource'
require 'gram_v2_client/configuration'
require 'gram_v2_client/base'
require 'gram_v2_client/account'
require 'gram_v2_client/group'
require 'gram_v2_client/role'
require 'gram_v2_client/version'

class GramV2Client
  def self.init_test
    GramV2Client.configure do |c|
    c.site = "http://localhost:3000/api/v2"
    c.user = "admin"
    c.password = "password"
    end
  end

end