require "spec_helper"

describe Microformat::Attribute do
  subject { Microformat::Attribute }
  
  describe "#initialize" do
    it "should accept a block of nested attributes" do
      attribute = subject.new(:name) do |attr|
        attr.attribute(:one)
        attr.attribute(:two)
        attr.attribute(:three) do |three|
          three.attribute(:four)
        end
      end
      
      expect(attribute.nested_attributes.size).to eq(3)
    end
    
    it "should set the name" do
      expect(subject.new(:fn).name).to eq(:fn)
    end
  end
end
