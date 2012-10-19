module Microformat
  class Review < Format
    selector ".hreview"
    
    attribute_map do
      attribute(:summary)
      attribute(:type)
      attribute(:item, format: [Card, nil]) do
        attribute(:fn, required: true) do
          attribute(:url, format: :url, attribute: "href")
          attribute(:photo, format: :url, attribute: ["href", "src"])
        end
      end
      attribute(:reviewer, format: Card)
      attribute(:rating, format: :decimal)
      attribute(:description)
      attribute(:tags, multiple: true, selector: "[rel='tag']")
      attribute(:permalink, selector: "[rel='bookmark']", attribute: "href")
    end
  end
end