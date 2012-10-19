require "microformat/format"
require "microformat/card"

module Microformat
  class Review < Format
    selector ".hreview"
    
    attribute_map do |map|
      map.attribute(:summary)
      map.attribute(:type)
      map.attribute(:item, format: [Card, nil]) do |item|
        item.attribute(:fn, required: true) do |fn|
          fn.attribute(:url, format: :url, attribute: "href")
          fn.attribute(:photo, format: :url, attribute: ["href", "src"])
        end
      end
      map.attribute(:reviewer, format: Card)
      map.attribute(:rating, format: :decimal)
      map.attribute(:description)
      map.attribute(:tags, multiple: true, selector: "[rel='tag']")
      map.attribute(:permalink, selector: "[rel='bookmark']", attribute: "href")
    end
  end
end