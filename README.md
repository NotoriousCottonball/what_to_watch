# WhatToWatch
### Best Reviewed and Recently Added Movies/Television Based on User's Streaming Subscriptions

This Ruby Gem provides a CLI to view Highest Rated/Recently Added Movies and Television according to Vulture.com Streaming Recommendations, and provides additional details on the user's selection according to IMDB.com. 
The Gem asks which popular streaming services the user has access to and whether the user wants recommendations for Highest Reviewed Films, Highest Reviewed Television, or Most Recent Additions. 
The Gem returns a filtered list of recommendatons from Vulture.com and then further details/information from IMDB.com upon user request. 

## Installation

### Add this line to your application's Gemfile:

```
gem 'what_to_watch'
```

### And then execute:

    $ bundle
    

### Or install it yourself as:

    $ gem install what_to_watch

## Usage

Type the below and follow the on screen prompts.

    $ what_to_watch

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

`bin/console` is coded with a #reload! method to refresh the state of the codebase during the console session. By default, the #reload! method reloads all `./lib` files in the current console session

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at 
### https://github.com/NotoriousCottonball/what_to_watch.
This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).