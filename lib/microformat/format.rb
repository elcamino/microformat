require "microformat/attribute_map"
require "microformat/selectors"

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
      new(document)
    end
    
    attr_reader :document
    
    def initialize(document)
      @document = document
    end
    
    def respond_to_missing?(name)
      false
    end

    def method_missing(name)
      super(name)
    end
    
    private
    def self.define_selector(selector)
      Selectors.define(selector, self)
      @selector = selector
    end
  end
end