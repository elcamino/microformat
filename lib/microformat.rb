require "microformat/version"
require "microformat/parser"
require "microformat/review"
require "microformat/review_aggregate"
require "microformat/card"

module Microformat
  def self.parse(*args)
    Parser.parse(*args)
  end
end