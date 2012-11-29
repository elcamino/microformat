require "nokogiri"
require "microformat/collection"
require "microformat/selectors"

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
    
    attr_reader :doc, :options
    
    def initialize(doc, options)
      @doc = doc
      @options = options
      parse(elements)
    end
    
    def parse(elements)
      i = 0; while i < [limit, elements.size].min do
        collection << elements[i]
        i += 1
      end
    end

    def limit
      @limit ||= options[:limit] || Float::INFINITY
    end
    
    def selectors
      @selectors ||= Selectors.filter(options[:filter])
    end
    
    def collection
      @collection ||= Collection.new
    end
    
    private
    def elements
      # TODO: Update to perform loop removing elements from the document
      # until none are left.
      @elements ||= begin
        elements = []
        while doc.css(selectors.join(", ")).length > 0
          node = doc.css(selectors.join(", ")).first
          node.remove
          elements << node
        end
        elements
      end
    end
  end
end