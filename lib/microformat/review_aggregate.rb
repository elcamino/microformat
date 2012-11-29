require "microformat/format"
require "microformat/card"

module Microformat
  class ReviewAggregate < Format
    selector ".hreview-aggregate"

    attribute_definition do |root|
      root.attribute(:item, format: Card)
      root.attribute(:rating, cast: :decimal)
      root.attribute(:count, cast: :integer)
      root.attribute(:votes, cast: :integer)
      root.attribute(:summary)
    end
  end
end