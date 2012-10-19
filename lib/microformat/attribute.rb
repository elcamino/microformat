module Microformat
  class Attribute
    def initialize(name, options = {}, &block)
      @name = name
      @options = options
      yield(&block) if block_given?
    end
    
    def attribute(*args)
      @nested_attributes ||= []
      @nested_attributes << Attribute.new(*args)
    end
  end
end