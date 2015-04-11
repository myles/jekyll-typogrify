# Jekyll::Typogrify

Improves typography on your Jekyll site using [typogruby](http://avdgaag.github.io/typogruby/).

[![Build Status](https://travis-ci.org/myles/jekyll-typogrify.svg?branch=master)](https://travis-ci.org/myles/jekyll-typogrify) [![Gem Version](https://badge.fury.io/rb/jekyll-typogrify.svg)](http://badge.fury.io/rb/jekyll-typogrify)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'jekyll-typogrify'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install jekyll-typogrify

## Usage

### Widont

Replaces space(s) before the last word (or tag before the last word) before an optional closing element (a, em, span, strong) before a closing tag (p, h[1-6], li, dt, dd) or the end of the string.

```html
<h1>{{ "This is a rather long title." | widont }}</h1>

<h1>This is a rather long&nbsp;title.</h1>
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

1. Fork it ( https://github.com/myles/jekyll-typogrify/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
