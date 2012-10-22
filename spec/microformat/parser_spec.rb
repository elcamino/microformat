require "spec_helper"
require "nokogiri"

describe Microformat::Parser do
  describe "::parse" do
    subject do
      Microformat::Parser.parse(doc)
    end
    
    before(:each) do
      Microformat::Selectors.instance.replace({})
      [
        Microformat::Card,
        Microformat::Review
      ].each { |klass| klass.selector(klass.selector) }
    end
    
    let(:html) do
      %Q(<html><body></body></html>)
    end
    
    let(:review_html) do
      %Q(<html><body>
        <div class="hreview">
          <div class="summary">It's good</div>
          <div class="reviewer">
            <p class="fn">Dave</p>
          </div>
        </div>
      </body></html>)
    end
    
    context "given a HTML string" do
      let(:doc) { html }

      it "should return an instance of Microformat::Collection" do
        expect(subject).to be_kind_of Microformat::Collection
      end
    end
    
    context "given a HTML document" do
      let(:doc) { Nokogiri::HTML(html) }
    
      it "should return an instance of Microformat::Collection" do
        expect(subject).to be_kind_of Microformat::Collection
      end
    end
    
    context "given a HTML element" do
      let(:doc) { Nokogiri::HTML(html).css("body") }
    
      it "should return an instance of Microformat::Collection" do
        expect(subject).to be_kind_of Microformat::Collection
      end
    end
    
    context "given a HTML document with a hReview" do
      let(:doc) { Nokogiri::HTML(review_html) }
    
      it "should return a collection with one object" do
        expect(subject.size).to eq 1
      end
      
      describe "the returned Microformat object" do
        subject do
          Microformat::Parser.parse(doc).first
        end
        
        it "should be a Microformat::Review" do
          expect(subject).to be_kind_of(Microformat::Review)
        end
        
        it "should return the summary" do
          expect(subject.summary.value).to eq "It's good"
        end
        
        it "should return the reviewer's full name" do
          expect(subject.reviewer.fn.value).to eq "Dave"
        end
      end
    end
  end
end