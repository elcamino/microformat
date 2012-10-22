require "spec_helper"

describe Microformat::AttributeDefinition do
  subject { Microformat::AttributeDefinition }

  describe "#initialize" do
    it "should accept a block of nested attributes" do
      map = subject.new do |map|
        map.attribute(:one)
        map.attribute(:two)
      end

      expect(map.attributes.size).to eq(2)
    end
  end
end
