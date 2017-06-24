# Rack::Anystatus

Anystatus is a simpel [Rack]() application that will return a given status code and file for a given path. 

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rack-anystatus'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rack-anystatus

## Usage

Save the file you wish to serve somewhere that's accessible to your Rack application, and then setup a 'map' for the URL you want to serve followed by calling the app. For example I have `test/assets/200.html` and I wish to return a `200 OK` status code for it when `/app/ok` is called. To do this, my `config.ru` would look like this:

```ruby
require 'rack-anystatus'

map '/app/ok' do 
    run Rack::Anystatus::Endpoint.new(200, 'test/assets/200.html')
end
```

After running running `bundle exec rackup` a call to `http://localhost:9292/app/ok` will return the file with the given status code.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/Daniel Groves/rack-anystatus. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

