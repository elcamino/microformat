require "singleton"

module Microformat
  class Selectors < Hash
    include Singleton
    
    def self.class_matching(element)
      # load the CSS classes of the element
      css_classes = element["class"].split(/\s+/).map do |c|
        ".#{c}"
      end
      # loop through the classes
      Array(css_classes).each do |css_class|
        instance.each do |selector, klass|
          if selector == css_class
            return klass
          end
        end
      end
      raise RuntimeError, "No class is defined for any of the selectors: #{css_classes.join(" / ")}"
    end
    
    def self.define(selector, klass)
      if instance.has_key?(selector) && instance.fetch(selector) != klass
        raise ArgumentError, "#{instance.fetch(selector).name} has already implemented the selector '#{selector}'"
      else
        instance.merge!(selector => klass)
      end
    end
    
    def self.filter(klasses)
      instance.filter(klasses)
    end
    
    def filter(klasses)
      select do |selector, klass|
        Array(klasses).include?(klass)
      end.keys
    end
  end
end