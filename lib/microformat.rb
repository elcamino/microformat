require "microformat/version"
require "microformat/review"
require "microformat/card"

module Microformat
  def parse(*args)
    Parser.parse(*args)
  end
end