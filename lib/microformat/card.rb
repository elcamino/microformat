require "microformat/format"

module Microformat
  class Card < Format
    selector ".vcard"
    
    attribute_definition do |root|
      root.attribute(:fn, required: true)
      root.attribute(:n) do |n|
        n.attribute(:"honorific-prefix")
        n.attribute(:"given-name")
        n.attribute(:"additional-name")
        n.attribute(:"family-name")
        n.attribute(:"honorific-suffix")
      end
      root.attribute(:nickname)
      root.attribute(:org)
      root.attribute(:photo, cast: :url, attribute: ["href", "src"])
      root.attribute(:url, cast: :url, attribute: "href")
      root.attribute(:email, cast: :email)
      root.attribute(:tel, cast: :tel)
      root.attribute(:adr) do |adr|
        adr.attribute(:"street-address")
        adr.attribute(:locality)
        adr.attribute(:region)
        adr.attribute(:"postal-code")
        adr.attribute(:"country-name")
      end
      root.attribute(:"bday")
      root.attribute(:"category")
      root.attribute(:"note")
    end
  end
end