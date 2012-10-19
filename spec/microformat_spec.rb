require "spec_helper"

describe Microformat do
  subject { Microformat }

  describe "::parse" do
    let(:args) { ["one", 2, :three] }
    
    before(:each) do
      Microformat::Parser.should_receive(:parse).with(*args).and_return(true)
    end
    
    it "should pass args onto the parser" do
      expect(subject.parse(*args)).to be_true
    end
  end
end
