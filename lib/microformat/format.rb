require "microformat/attribute_definition"
require "microformat/selectors"

module Microformat
  class Format
    def self.selector(selector = nil)
      define_selector(selector) if selector
      @selector
    end
    
    def self.attribute_definition(&block)
      @attribute_definition = AttributeDefinition.new(&block) if block_given?
      @attribute_definition
    end

    def self.parse(document)
      new(document)
    end
    
    attr_reader :document
    
    def initialize(document)
      @document = document
    end
    
    def respond_to_missing?(name, public_only = false)
      attribute_map.respond_to?(name)
    end

    def method_missing(name)
      if attribute_map.respond_to?(name)
        attribute_map.send(name)
      else
        super(name)
      end
    end
    
    private
    def attribute_map
      @attribute_map ||= self.class.attribute_definition.map_to(document)
    end
    
    def self.define_selector(selector)
      Selectors.define(selector, self)
      @selector = selector
    end
  end
end