module Microformat
  class Card < Format
    selector ".vcard"
    
    attribute_map do
      attribute(:fn, required: true)
      attribute(:n) do
        attribute(:"honorific-prefix")
        attribute(:"given-name")
        attribute(:"additional-name")
        attribute(:"family-name")
        attribute(:"honorific-suffix")
      end
      attribute(:nickname)
      attribute(:org)
      attribute(:photo, format: :url)
      attribute(:url, format: :url)
      attribute(:email, format: :email)
      attribute(:tel, format: :tel)
      attribute(:adr) do
        attribute(:"street-address")
        attribute(:locality)
        attribute(:region)
        attribute(:"postal-code")
        attribute(:"country-name")
      end
      attribute(:"bday")
      attribute(:"category")
      attribute(:"note")
    end
  end
end