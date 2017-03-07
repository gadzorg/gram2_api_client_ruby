require "base64"
class GramAccountMocker


  DEFAULT_GRAM_ACCOUNT={
      "uuid"=>"12345678-1234-1234-1234-123456789012",
      "hruid"=>"francois.dupont.2011",
      "firstname"=>"Francois",
      "lastname"=>"Dupont",
      "id_soce"=>"84189",
      "enable"=>"TRUE",
      "id"=>98765,
      "uid_number"=>99765,
      "gid_number"=>99765,
      "home_directory"=>"/nonexistant",
      "alias"=>["francois.dupont.2011", "98765", "98765J"],
      "password"=>"Not Display",
      "email"=>"francois.dupont",
      "email_forge"=>"francois.dupont@poubs.org",
      "birthdate"=>"1987-09-17 00:00:00",
      "login_validation_check"=>"CGU=2015-06-04;",
      "description"=>"Agoram inscription - via module register - creation 2015-06-04 11:32:48",
      "entities"=>["comptes", "gram"],
      "is_gadz"=>"true",
      "gapps_id" => nil
  }

  attr_reader :attributes

  def initialize(attr={},auth=nil)
    @auth=auth
    @attributes=attr
  end

  def uuid
    @attributes["uuid"]
  end

  def self.for(attr:{},auth: nil)
    string_hash=attr.inject({}){|memo,(k,v)| memo[k.to_s] = v; memo}
    self.new(DEFAULT_GRAM_ACCOUNT.merge(string_hash),auth)
  end

  def uri_for_get_request(with_password: false)
    uri= "/api/v2/accounts/#{uuid}.json"
    uri+= "?show_password_hash=true" if with_password
    uri
  end

  def mock_get_request(with_password: false)
    uri=uri_for_get_request(with_password: with_password)
    ActiveResource::HttpMock.respond_to({},false) do |mock|
      mock.get uri, {"Authorization"=>authorization_header,'Accept' => 'application/json'}, attributes.to_json, 200
    end
  end

  def mock_search_request_for(param,value=nil,response=[attributes])
    value||=attributes[param.to_s]
    value=URI.escape(URI.escape(value.to_s),"@")
    response=response.to_json unless response.is_a? String
    ActiveResource::HttpMock.respond_to({},false) do |mock|
      mock.get "/api/v2/accounts.json?#{param.to_s}=#{value}", {"Authorization"=>authorization_header,'Accept' => 'application/json'}, response, 200
    end
  end

  def mock_put_request()
    uri= "/api/v2/accounts/#{uuid}.json"
    ActiveResource::HttpMock.respond_to({},false) do |mock|
      mock.put uri, {"Authorization"=>authorization_header,'Content-Type' => 'application/json'}, attributes.to_json, 200
    end
  end

  def self.reset!
    ActiveResource::HttpMock.reset!
  end

  def self.http_basic_auth_header(user,password)
    "Basic "+Base64.encode64("#{user}:#{password}").chomp
  end

  private

  def authorization_header
    @auth
  end

end
