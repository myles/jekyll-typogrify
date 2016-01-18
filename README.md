# Jekyll::Typogrify

Improves typography on your Jekyll site using [typogruby](http://avdgaag.github.io/typogruby/) and [titlecase](https://github.com/samsouder/titlecase).

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

You now need to enable the plugin in your Jekyll web site. Append it to the `gems` array in your `_config.yml` file:

```yaml
gems:
- jekyll-typogrify
```

## Usage

### Andpercent

Converts an andpercent (ex. `&`) converts a & surrounded by optional whitespace or a non-breaking space to the HTML entity and surrounds it in a span with a styled class.

```html
<h1>{{ "Mr. & Mrs. Smith" | amp }}</h1>

<h1>Mr. <span class="amp">&amp;</span> Mrs. Smith</h1>
```

### Capitalisation

Surrounds two or more consecutive capital letters, perhaps with interspersed digits and periods in a span with a styled class.

```html
<h1>{{ "A.B.C. Corp." | caps }}</h1>

<h1><span class="caps">A.B.C.</span> Corp.</h1>
```

### Entities

Converts special characters (excluding HTML tags) to HTML entities.

```html
<p>© Myles Braithwaite</p>

<p>&copy; Myles Braithwaite</p>
```

### Initial Quotes

Encloses initial single or double quote, or their entities (optionally preceeded by a block element and perhaps an inline element) with a span that can be styled.

```html
<h1>{{ 'Myles "The Great" Braithwaite' | initial_quotes }}</h1>

<h1>Myles &ldquo;The Great&rdquo; Braithwaite</h1>
```

### Smartypants

Applies smartypants to a given piece of text.

```html
<p>{{ "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas massa dui, hendrerit et neque ut, pretium vulputate felis. Aliquam vestibulum semper magna et eleifend. Proin erat elit, sagittis eu faucibus ornare, elementum eget lectus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus." | smartypants }}</p>
```

### Widont

Replaces space(s) before the last word (or tag before the last word) before an optional closing element (a, em, span, strong) before a closing tag (p, h[1-6], li, dt, dd) or the end of the string.

```html
<h1>{{ "This is a rather long title." | widont }}</h1>

<h1>This is a rather long&nbsp;title.</h1>
```

### Titlecase

Convert a given piece of text to titlecase.

```html
<h1>{{ "i love toronto" | titlecase }}</h1>

<h1>I Love Toronto</h1>
```

### Improve

Main function to do all the typogruby functions from the method.

```html
<h1>{{ "Improve This Title" | improve }}</h1>
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
