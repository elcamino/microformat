module Microformat
  class Format    
    def self.selector(selector = nil)
      define_selector(selector) if selector
      @selector
    end
    
    def self.attribute_map(&block)
      @attribute_map = AttributeMap.new(&block) if block_given?
      @attribute_map
    end
    
    def self.parse(document)
      
    end
    
    attr_accessor :attributes
    
    def initialize(attributes = {})
      self.attributes = attributes
    end
    
    private
    def self.define_selector(selector)
      Selectors.define(selector, self)
      @selector = selector
    end
  end
end