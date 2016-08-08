require 'active_resource'

class GramV2Client::Base < ActiveResource::Base
  # This is set to enable Configuration change at runtime.
  
  def to_param
    uuid
  end

  class << self
    def site
      if GramV2Client.configuration.site
        if super.to_s != URI.parse(GramV2Client.configuration.site).to_s
          reload_config
        end
      end
      super
    end

    def user()
      if GramV2Client.configuration.user
        if super.to_s != GramV2Client.configuration.user
          reload_config
        end
      end
      super
    end

    def password()
      if GramV2Client.configuration.password
        if super.to_s != GramV2Client.configuration.password
          reload_config
        end
      end
      super
    end

    def proxy()
      if GramV2Client.configuration.proxy
        if super.to_s != URI.parse(GramV2Client.configuration.proxy).to_s
          reload_config
        end
      end
      super
    end


    def reload_config
      self.site= GramV2Client.configuration.site
      self.user= GramV2Client.configuration.user
      self.password=GramV2Client.configuration.password
      self.proxy=GramV2Client.configuration.proxy
    end
  end

end







