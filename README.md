# Microformat

Reads Microformats from HTML documents

[![Build Status][2]][1] [![Code Climate][3]][4]

  [1]: http://travis-ci.org/platformq/microformat
  [2]: https://secure.travis-ci.org/platformq/microformat.png?branch=master
  [3]: https://codeclimate.com/badge.png
  [4]: https://codeclimate.com/github/platformq/microformat

## Installation

Add this line to your application's Gemfile:

```ruby
gem "microformat"
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install microformat

## Usage

You can parse a document (or partial document), providing the HTML as a string:

```ruby
html = "<html>...</html>"
Microformat.parse(html) # => Microformat::Collection
```

Or provide a Nokogiri element:

```ruby
require "nokogiri"

html = "<html>...</html>"
doc = Nokogiri::HTML(html)
element = doc.css("body")
Microformat.parse(element)
# => Microformat::Collection
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
