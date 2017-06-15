# Nbrb::Api

The gem is not complete! Only daily exchange rates methods are available

## Installation

Add this line to your application's Gemfile:

    gem 'nbrb-api'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install nbrb-api

## Usage

```ruby
Nbrb::Api.daily_rates
# =>
{
  "USD"=> {
    :cur_quot_name=>"1 доллар США",
    :cur_scale=>"1",
    :cur_official_rate=>"17683.00",
    :cur_code=>"840",
    :cur_abbreviation=>"USD"
  },
  "DKK"=> {
    :cur_quot_name=>"1 датская крона",
    :cur_scale=>"1",
    :cur_official_rate=>"2641.72",
    :cur_code=>"208",
    :cur_abbreviation=>"DKK"
  },
  ...
}
# It is also possible to specify date to get rates:
Nbrb::Api.daily_rates(Date.yesterday)
Nbrb::Api.daily_rates('2015.08.05')
Nbrb::Api.daily_rates(1.year.ago)
```

### With proxy
```ruby
Nbrb::Api.proxy = 'http://proxy.local:1234'
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
