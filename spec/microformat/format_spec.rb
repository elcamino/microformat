require "spec_helper"

module Microformat
  class TestFormat < Microformat::Format; end
end

describe Microformat::Format do
  after(:each) do
    Microformat::Selectors.instance.replace({})
  end
  
  describe "::selector" do
    describe "getting the value" do
      it "should return the value" do
        Microformat::TestFormat.selector ".review"
        expect(Microformat::TestFormat.selector).to eq ".review"
      end
    end
    
    describe "setting the value" do
      it "should define the selector" do
        Microformat::TestFormat.selector ".review2"
        expect(Microformat::Selectors.instance[".review2"]).to eq Microformat::TestFormat
      end
    end
  end
  
  describe "::attribute_definition" do
    describe "setting the value" do
      it "should accept a block and set the map correctly" do
        map = Microformat::TestFormat.attribute_definition do |attr|
          attr.attribute :name
        end
        expect(map.attributes.values.first.name).to eq :name
      end
    end
  end
  
  describe "::parse" do
    it "should return and instance of the format using the given document" do
      html = %Q(<html><body>Something</body></html>)
      doc = Nokogiri::HTML(html)
      expect(Microformat::TestFormat.parse(doc).document).to eq doc
    end
  end
end