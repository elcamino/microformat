require "microformat/format"

module Microformat
  class Card < Format
    selector ".vcard"
    
    attribute_map do |map|
      map.attribute(:fn, required: true)
      map.attribute(:n) do |n|
        n.attribute(:"honorific-prefix")
        n.attribute(:"given-name")
        n.attribute(:"additional-name")
        n.attribute(:"family-name")
        n.attribute(:"honorific-suffix")
      end
      map.attribute(:nickname)
      map.attribute(:org)
      map.attribute(:photo, format: :url)
      map.attribute(:url, format: :url)
      map.attribute(:email, format: :email)
      map.attribute(:tel, format: :tel)
      map.attribute(:adr) do |adr|
        adr.attribute(:"street-address")
        adr.attribute(:locality)
        adr.attribute(:region)
        adr.attribute(:"postal-code")
        adr.attribute(:"country-name")
      end
      map.attribute(:"bday")
      map.attribute(:"category")
      map.attribute(:"note")
    end
  end
end