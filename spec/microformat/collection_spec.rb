require "spec_helper"

describe Microformat::Collection do
  subject do
    Microformat::Collection.new
  end
  
  describe "#<<" do
    it "should parse the element to the collection" do
      selector = ".selector"
      source = %Q(<html><body>
          <div class="#{selector.gsub(/^\./, "")}"></div>
      </body></html>)
      element = Nokogiri::HTML(source).css(selector).first
      parsed = mock("parsed_object")
      format = mock("format")
      format.should_receive(:parse).and_return(parsed)
      Microformat::Selectors.define(selector, format)
      subject << element
      expect(subject).to include parsed
    end
  end

  describe "#filter" do
    it "should filter the collection down to the specific classes" do
      objects = [Object.new, Hash.new, Array.new]
      subject.replace(objects)
      expect(subject.filter(Hash)).to eq [objects[1]]
    end
  end
end