require "singleton"

module Microformat
  class Selectors < Hash
    include Singleton
    
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