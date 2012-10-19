require "nokogiri"

module Microformat
  class Parser
    def self.parse(doc, options = {})
      # ensure the document is parsed
      unless doc.respond_to?(:css)
        doc = Nokogiri::HTML(doc)
      end
      # return the collection
      new(doc, options).collection
    end
    
    attr_reader :doc
    
    def initialize(doc, options)
      @doc = doc
      @options = options
      parse(elements)
    end
    
    def parse(elements)
      i = 0; while i < limit && elements.size > 0
        collection << elements.delete_at(0)
        i++
      end
    end

    def limit
      @limit ||= options[:limit] || Float::INFINITY
    end
    
    def selectors
      Selectors.filter(Array(options[:filter]))
    end
    
    def collection
      @collection ||= Collection.new
    end
    
    private
    def elements
      @elements ||= doc.css(selectors.join(", "))
    end
  end
end