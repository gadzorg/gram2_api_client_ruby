require 'active_resource'
require 'gram_v2_client/base'

class GramV2Client::Account < GramV2Client::Base

  def add_to_group(group)
    post(self.uuid + "/groups", group_uuid: group.uuid)
  end

  def remove_from_group(group)
    delete(self.uuid + "/groups/" + group.uuid)
  end

  def add_role(role)
    post(self.uuid + "/roles", role_uuid: role.uuid)
  end

  def revoke_role(role)
    delete(self.uuid + "/roles/" + role.uuid)
  end
end