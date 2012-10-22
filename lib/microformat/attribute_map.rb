module Microformat
  class AttributeMap
    attr_reader :definition, :document
    
    def initialize(definition, document, values = {})
      @definition = definition
      @document = document
      @values = values
      @attribute_cache = {}
    end
    
    def respond_to_missing?(name, public_only = false)
      values_responds_to?(name) ||
      definition_responds_to?(name)
    end
    
    def method_missing(name, *args, &block)
      if values_responds_to?(name)
        @values.fetch(name.to_sym)
      elsif @attribute_cache.has_key?(name)
        @attribute_cache[name]
      elsif definition_responds_to?(name)
        attribute = @definition.attributes.fetch(name)
        value = attribute.read_from(document)
        @attribute_cache[name] = value
      else
        super(name)
      end
    end
    
    private
    def values_responds_to?(name)
      @values.has_key?(name.to_sym)
    end
    
    def definition_responds_to?(name)
      @definition.attributes.has_key?(name.to_sym)
    end
  end
end