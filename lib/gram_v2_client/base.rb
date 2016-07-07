require 'json_api_client'


class GramV2Client::Base < JsonApiClient::Resource
  # set the api base url in an abstract base class

  def self.site
    GramV2Client.configuration.site
  end

end







