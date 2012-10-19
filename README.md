# Microformat

Reads Microformats from HTML documents

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
element = doc.css(".hreview")
Microformat.parse(element)
# => Microformat::Collection
```

Collections act as standard Ruby arrays, however they provide additional filtering methods:

```ruby
collection = Microformat.parse(element)
# => Microformat::Collection (of all microformat objects)
collection.filter(:reviews, :review_aggregates)
# => Microformat::Collection (of only hreviews and hreview-aggregates)
collection.reviews
# => Microformat::Collection (of only hreviews)
collection.cards
# => Microformat::Collection (of only hcards)
```

You can also improve performance by passing a set of formats to the initial parse:

```ruby
Microformat.parse(element, filter: [:reviews, :cards])
# => Microformat::Collection (of only hreviews and hcards)
```

You can specify a limit (should you only want the first or a few objects)

```ruby
Microformat.parse(element, limit: 3)
# => Microformat::Collection (of max size 3)
```

You can also parse a Nokogiri element to return an object of the first found exact Microformat:

```ruby
html = "<html>...</html>"
doc = Nokogiri::HTML(html)
element = doc.css(".hcard")
Microformat::Card.parse(element)
# => Microformat::Card instance
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
