[![Gem Version](https://badge.fury.io/rb/dnb-direct-ruby.svg)](https://badge.fury.io/rb/dnb-direct)
[![License](https://img.shields.io/github/license/dnbtools/dnb-direct-ruby.svg)]()
[![](https://img.shields.io/github/issues/dnbtools/dnb-direct-ruby.svg)]()
# DnB Direct API SDK for Ruby

This is a Ruby GEM from Dun & Bradstreet that provides simplified, programmatic access to the Direct 1.x, 2.x and Plus(+) APIs.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'dnb-direct-ruby'
```

And then execute:

```
$ bundle install
```

Or install it yourself as:
```
$ gem install dnb-direct-direct
```

## Usage
In order to fulfill API requests, valid credentials must be supplied. Each of the three families of APIs require a different set of credentials. You will need to be an existing customer with active credentials for the appropriate class of API.

The following illustrates the requirements for each.

### Direct 1.x

```ruby
DnB::Direct::One.use_credentials "YOURUSERNAME", "YOURPASSWORD", "YOURKEY"
```

### Direct 2.x
TODO

### Direct Plus
```ruby
DnB::Direct::Plus.use_credentials "YOURAPIKEY", "YOURSECRET"
```


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/dnb-direct. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
