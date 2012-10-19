module Microformat
  class Collection < ::Array
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