# GramV2Client
## Installation

Add this line to your application's Gemfile:

```ruby
gem 'gram_v2_client', git: 'https://github.com/gadzorg/gram2_api_client_ruby.git'
```

And then execute:

    $ bundle

## Setup
  
  Before being used GramV2Client must be configured. In Rails app, put it in an Initializer.

```ruby
GramV2Client.configure do |c|
   # Base URI used to access GrAM API
   c.site="http://my_site.org/api/v1/"
   # Username provided by Gadz.org
   c.user="my_user"
   # Password provided by Gadz.org
   c.password="my_password"
   # If your app use a proxy to access net, put it here
   c.proxy="my_proxy"
 end
 GramV2Client.init
 
 
```

Tips : you can init a config for the test environment (local instance of gram2_api_server and default admin account) with `GramV2Client.init_test`.
## Usage
This client is based on ActiveRessource thus you can manipulate `account`, `group` and `role` as Ruby objects.
### Account
#### Find
```ruby
# Return all accounts
GramV2Client::Account.all

# Return first account
GramV2Client::Account.first

# Find account with uuid = "c2ce6327-158d-458a-9e76-c89ac9c14a14"
account = GramV2Client::Account.find("c2ce6327-158d-458a-9e76-c89ac9c14a14")
puts account.firstname
puts account.lastname
#=> John
#=> Doe
````
#### Update
```ruby
account = GramV2Client::Account.find("c2ce6327-158d-458a-9e76-c89ac9c14a14")
account.firstname = "Johny"
account.save
````

#### Create
```ruby
account = GramV2Client::Account.new(
  firstname: "John", 
  lastname: "Doe", 
  email: "john.doe@test.test", 
  password: "passw0rd",
  is_gadz: false
  )
account.save
````
Or
```ruby
account = GramV2Client::Account.create(
  firstname: "John", 
  lastname: "Doe", 
  email: "john.doe@test.test", 
  password: "passw0rd",
  is_gadz: false
  )
````

### Group
#### Find
```ruby
# Return all groups
GramV2Client::Group.all

# Return first group
GramV2Client::Group.first

# Find group with uuid = "ffa43f12-f47b-44ea-ad81-f7ede483f394"
group = GramV2Client::group.find("ffa43f12-f47b-44ea-ad81-f7ede483f394")
puts group.short_name
#=> My_group
````

#### Members
```ruby
# Find members of group with uuid = "ffa43f12-f47b-44ea-ad81-f7ede483f394"
group = GramV2Client::group.find("ffa43f12-f47b-44ea-ad81-f7ede483f394").account
# Return Accounts collection
````

##### Add/remove member
```ruby
group = GramV2Client::group.find("ffa43f12-f47b-44ea-ad81-f7ede483f394")
account = GramV2Client::Account.find("c2ce6327-158d-458a-9e76-c89ac9c14a14")

# Add account with uuid = "c2ce6327-158d-458a-9e76-c89ac9c14a14" to group with uuid = "ffa43f12-f47b-44ea-ad81-f7ede483f394"
account.add_to_group(group)

# Remove account with uuid = "c2ce6327-158d-458a-9e76-c89ac9c14a14" to group with uuid = "ffa43f12-f47b-44ea-ad81-f7ede483f394"
account.remove_from_group(group)

````
#### Role
Roles management is exactly the same as group management. 
## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/gadzorg/gram2_api_client_ruby.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
