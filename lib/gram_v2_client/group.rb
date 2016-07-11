require 'gram_v2_client/base'
require 'active_resource'


class GramV2Client::Group < GramV2Client::Base

  def accounts
    GramV2Client::Account.find(:all, from: self.class.site.to_s + "/groups/" + self.uuid + "/accounts")
  end
end