require "spec_helper"

module Microformat
  class TestFormat < Microformat::Format; end
end

describe Microformat::Format do
  describe "::selector" do
    describe "getting the value" do
      context "when a value is set" do
        it "should return the value" do
          Microformat::TestFormat.selector ".review"
          expect(Microformat::TestFormat.selector).to eq ".review"
        end
      end
      
      context "when a value is not set" do
        it "should return nil" do
          expect(Microformat::TestFormat.selector).to be_nil
        end
      end
    end
    
    describe "setting the value" do
      it "should define the selector" do
        Microformat::TestFormat.selector ".review"
        expect(Microformat::Selectors.instance[".review"]).to eq Microformat::TestFormat
      end

      it "should store the selector in the class" do
        Microformat::TestFormat.selector ".review"
      end
    end
  end
  
  describe "::attribute_map" do
    describe "getting the value" do
      context "when a value is set" do
        it "should return an instance of AttributeMap" do
          expect(Microformat::TestFormat.attribute_map).to be_kind_of Microformat::AttributeMap
        end
      end
      
      context "when a value is not set" do
        it "should return nil" do
          expect(Microformat::TestFormat.attribute_map).to be_nil
        end
      end
    end

    describe "setting the value" do
      it "should accept a block" do
        map = Microformat::TestFormat.attribute_map do |attr|
          attr.attribute :name
        end
        expect(map.attributes.first.name).to eq :name
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