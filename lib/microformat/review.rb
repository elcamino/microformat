require "microformat/format"
require "microformat/card"

module Microformat
  class Review < Format
    selector ".hreview"
    
    attribute_definition do |root|
      root.attribute(:summary)
      root.attribute(:type)
      root.attribute(:item, format: Card)
      root.attribute(:reviewer, format: Card)
      root.attribute(:rating, cast: :decimal)
      root.attribute(:description)
      root.attribute(:tags, multiple: true, selector: "[rel='tag']")
      root.attribute(:permalink, selector: "[rel='bookmark']", attribute: "href")
    end
  end
end