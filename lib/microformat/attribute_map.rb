require "microformat/attribute"

module Microformat
  class AttributeMap
    def initialize(&block)
      block.yield(self)
    end
    
    def attribute(name, options = {}, &block)
      Attribute.new(name, options, &block)
    end
  end
end