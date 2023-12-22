[![Build Status](https://travis-ci.org/myles/jekyll-typogrify.svg?branch=develop)](https://travis-ci.org/myles/jekyll-typogrify)
[![Build Status](https://ci.appveyor.com/api/projects/status/bw6g4akc9x8g1x33/branch/master?svg=true)](https://ci.appveyor.com/project/MylesBraithwaite/jekyll-typogrify/branch/develop)
[![Gem Version](https://badge.fury.io/rb/jekyll-typogrify.svg)](http://badge.fury.io/rb/jekyll-typogrify)
[![Code Climate](https://codeclimate.com/github/myles/jekyll-typogrify/badges/gpa.svg)](https://codeclimate.com/github/myles/jekyll-typogrify)
[![Test Coverage](https://codeclimate.com/github/myles/jekyll-typogrify/badges/coverage.svg)](https://codeclimate.com/github/myles/jekyll-typogrify/coverage)

# Jekyll::Typogrify

Improves typography on your Jekyll site using [typogruby](http://avdgaag.github.io/typogruby/), [titlecase](https://github.com/samsouder/titlecase), and some other useful functions.

| Before | After |
| ------ | ----- |
| ![Before](https://raw.githubusercontent.com/myles/jekyll-typogrify/master/screenshots/before.png) | ![After](https://raw.githubusercontent.com/myles/jekyll-typogrify/master/screenshots/after.png) |

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

### Ampersand

Converts an ampersand (ex. `&`) converts a & surrounded by optional whitespace or a non-breaking space to the HTML entity and surrounds it in a span with a styled class.

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

#### Custom Capitalisation

Typogruby `cap` module doesn't support having hyphens so there is a custom
module:

```html
<h1>{{ "North American P-51 Mustang" | jt_caps }}</h1>

<h1>North American <span class="caps">P-51</span> Mustang</h1>
```

### Entities

Converts special characters (excluding HTML tags) to HTML entities.

```html
<p>{{ "© Myles Braithwaite" | entities }}</p>

<p>&copy; Myles Braithwaite</p>
```

### Initial Quotes

Encloses initial single or double quote, or their entities (optionally preceeded by a block element and perhaps an inline element) with a span that can be styled.

```html
<h1>{{ '"Do not cry because it is over, simile because it happened."' | initial_quotes }}</h1>

<h1><span class="dquo">"</span>Do not cry because it is over, simile because it happened."</h1>
```

### Smartypants

Applies smartypants to a given piece of text.

```html
<p>{{ "Today I'm going to the... coffeeshop." | smartypants }}</p>

<p>Today I&#8217;m going to the&#8230; coffeeshop.</p>
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

<h1>Improve This&nbsp;Title</h1>
```

### Letter Spacing

Let's make sure click doesn't look like dick.

```html
<p>{{ "There’s more to love with every click." | letter_spacing }}</p>

<p>There’s more to love with every <span class="fix-letter-spacing">click</p>.</p>
```

### Em dash

Identify em dashes and surround them with a span.

```html
<p>{{ "Upon discovering the errors—all 124 of them—the publisher immediately recalled the books." | jt_emdash }}</p>

<p>Upon discovering the errors<span class="emdash">&mdash;</span>all 124 of them<span class="emdash">&mdash;</span>the publisher immediately recalled the books.</p>
```

## Development

After checking out the repo, run `make setup` to install dependencies. Then, run `make console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md).
