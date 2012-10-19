module Microformat
  class Attribute
    attr_reader :name, :options, :nested_attributes

    def initialize(name, options = {}, &block)
      @name = name
      @options = options
      block.yield(self) if block_given?
    end
    
    def attribute(*args)
      @nested_attributes ||= []
      @nested_attributes << Attribute.new(*args)
    end
  end
end