require "microformat/attribute"

module Microformat
  class AttributeMap
    attr_reader :attributes
    
    def initialize(&block)
      block.yield(self)
    end
    
    def attribute(name, options = {}, &block)
      @attributes ||= []
      @attributes << Attribute.new(name, options, &block)
    end
  end
end