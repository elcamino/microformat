require "microformat/attribute_map"

module Microformat
  class Attribute
    attr_reader :name, :options, :attributes

    def initialize(name, options = {}, &block)
      @name = name
      @options = options
      @attributes ||= {}
      if options[:format]
        @attributes.merge!(options[:format].attribute_definition.attributes)
      end
      block.yield(self) if block_given?
    end
    
    def attribute(name, options = {}, &block)
      Attribute.new(name, options, &block).tap do |attribute|
        @attributes.merge!(name.to_sym => attribute)
      end
    end
    
    def read_from(document)
      selector = options[:selector] || ".#{@name}"
      sub_document = document.css(selector).first
      value = read_value_from(sub_document)
      AttributeMap.new(self, sub_document, { value: value })
    end
    
    def read_value_from(document)
      Array(options[:attribute] || "text").each do |attr|
        if attr == "text"
          return document.text
        elsif document[attr]
          return document[attr]
        end
      end
      return nil
    end
  end
end