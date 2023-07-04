# Karma

Karma is a ~key-value~ key-counter database, you can find it in a separate [repository](https://github.com/creadone/karma). This repo contains straightforward Ruby client for Karma.

## Installation

Install the gem and add to the application's Gemfile by executing:

    $ bundle add karma

If bundler is not being used to manage dependencies, install the gem by executing:

    $ gem install karma

## Configuration

```Ruby
require 'karma'

Karma.configure do |config|
  config.port = 8080
  config.host = "localhost"
end

```

## Usage

The client supports all possible functionality, which means that Karma can be fully managed by commands. Each command returns an execution status in the `success` attribute and an execution result or an error in the `result` attribute. For example:

```Ruby
# Deletes an existing tree
Karma.drop('comments')

# success: <OpenStruct success=true, response="OK">
# error: <OpenStruct success=false, response="Tree \"comments\" not exists">
```

The control commands allow you to maintain the database:

```Ruby
# Checks the server
Karma.ping

# Creates new tree "comments" or check if exists
Karma.create('comments')

# Get list of trees in the memory
Karma.trees

# Delete tree "comments"
Karma.drop('comments')

# Get list of all dumps
Karma.dumps

# Dumps tree to the backup directory
Karma.dump('comments')

# Make a backup on FS for each tree in memory
Karma.dump_all

# Load a dump of the tree into memory (existing tree will overwrited)
Karma.load('1688496993_comments.tree')
```

The tree commands allow you to work with specific tree:

```Ruby
# Increment the value in the tree for the key
Karma.tree('comments').increment(key: 12345)

# Increment the value in the tree for the key
Karma.tree('comments').decrement(key: 12345)

# Get total value in the tree for the key
Karma.tree('comments').sum(key: 12345)

# Get total value in the tree for the key between dates
Karma.tree('comments').sum(key: 12345, time_from: 20230601, time_to: 20230629)

# Get hash where key is date and value is total for key between dates
Karma.tree('comments').find(key: 12345, time_from: 20230601, time_to: 20230629)

# Get hash where key is key number and value is total over the tree between dates
Karma.tree('comments').find(time_from: 20230601, time_to: 20230629)

# Delete all values for the key between dates
Karma.tree('comments').delete(key: 12345, time_from: 20230601, time_to: 20230629)

# Delete all values over the tree between dates
Karma.tree('comments').delete(time_from: 20230601, time_to: 20230629)

# Delete all values for the key
Karma.tree('comments').reset(key: 12345)

# Delete all values for the tree
Karma.tree('comments').reset
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/creadone/karmarb.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
