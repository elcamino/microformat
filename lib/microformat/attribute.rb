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
          return cast(document.text, options[:cast])
        elsif document[attr]
          return cast(document[attr], options[:cast])
        end
      end
      return nil
    end
    
    def cast(value, cast_to = nil)
      case cast_to
      when :integer then value.to_i
      when :decimal then value.to_f
      when :string then value.to_s
      else value
      end
    end
  end
end