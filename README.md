# SplitNum

A bunch of helpers to split a number into smaller parts, by percentage of fixed amounts.

Example:

```ruby
n = 100.0
SplitNum.split(n, {
  fixed: 20,
  percent: [10, 50, 40],
})

# Returns:
{
  fixed: 20.0,
  percent: {
    10 => 8.0,
    50 => 40.0,
    40 => 32.0,
  }
}
```

## Installation

Add this line to your application's Gemfile:

    gem 'split_num'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install split_num

## Usage

TODO: Write usage instructions here

## Contributing

1. Fork it ( https://github.com/[my-github-username]/split_num/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
