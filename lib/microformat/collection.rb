require "microformat/selectors"

module Microformat
  class Collection < ::Array
    def <<(element)
      # load the CSS classes of the element
      classes = element["class"].split(/\s+/)
      # load the first matching format
      format = Selectors.class_matching(classes)
      # use the microformat to parse the element
      parsed = format.parse(element)
      # add the parsed object to the array
      super(parsed)
    end
    
    def filter(*args)
      classes = Array(args).flatten
      # find the applicable classes
      filtered = select do |object|
        Array(classes).include?(object.class)
      end
      # create a new collection from them
      self.class.new.tap do |collection|
        collection.replace(filtered)
      end
    end
  end
end