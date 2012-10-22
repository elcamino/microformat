require "microformat/attribute"
require "microformat/attribute_map"

module Microformat
  class AttributeDefinition
    attr_reader :attributes
    
    def initialize(&block)
      @attributes ||= {}
      block.yield(self)
    end
    
    def attribute(name, options = {}, &block)
      Attribute.new(name, options, &block).tap do |attribute|
        @attributes.merge!(name.to_sym => attribute)
      end
    end
    
    def map_to(document)
      AttributeMap.new(self, document)
    end
  end
end