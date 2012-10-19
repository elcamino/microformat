require "spec_helper"

describe Microformat::Selectors do
  let(:selectors) { Hash.new }
  
  subject do
    Microformat::Selectors.instance
  end
  
  before(:each) do
    selectors.each do |sel,klass|
      Microformat::Selectors.define(sel, klass)
    end
  end
  
  after(:each) do
    Microformat::Selectors.instance.replace({})
  end

  describe "::instance" do
    it "should always return the same object" do
      expect(subject.class.instance.object_id).to eq subject.class.instance.object_id
    end
  end
  
  describe "::define" do
    context "when the selector is already defined" do
      it "should raise an exception" do
        subject.class.define(".hello", Hash)
        expect {
          subject.class.define(".hello", Object)
        }.to raise_error(ArgumentError)
      end
    end
    
    context "when redefining the selector" do
      it "should not raise an exception" do
        subject.class.define(".hello", Hash)
        expect {
          subject.class.define(".hello", Hash)
        }.not_to raise_error(ArgumentError)
      end
    end
    
    context "when the selector is not defined" do
      it "should add the definition to the hash" do
        subject.class.define(".hello", Hash)
        expect(subject[".hello"]).to eq Hash
      end
    end
  end
  
  describe "::filter" do
    let(:selectors) do
      { ".review" => Object }
    end

    it "should return an array of selectors that match the given classes" do
      expect(subject.class.filter(Object)).to eq [".review"]
      expect(subject.class.filter(Hash)).to eq []
    end
  end
end
