# GramV2Client
## Installation

Add this line to your application's Gemfile:

```ruby
gem 'gram_v2_client', git: => 'https://github.com/gadzorg/gram2_api_client_ruby.git'
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
## Usage
TODO
## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/gadzorg/gram2_api_client_ruby.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).