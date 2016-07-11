require 'gram_v2_client/base'
require 'active_resource'


class GramV2Client::Group < GramV2Client::Base
  #has_many :accounts, class_name: "GramV2Client::Accounts"

  def acc
    get(uuid+"/accounts")
  end
end