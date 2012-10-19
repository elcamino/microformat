module Microformat
  class AttributeMap
    def initialize(&block)
      yield(&block)
    end
    
    def attribute(name, options = {}, &block)
      Attribute.new(name, options, &block)
    end
  end
end