# frozen_string_literal: true

require_relative 'color_namer_ruby/version'

require_relative 'color_namer_ruby/basic'
require_relative 'color_namer_ruby/html'
require_relative 'color_namer_ruby/ntc'
require_relative 'color_namer_ruby/pantone'
require_relative 'color_namer_ruby/roygbiv'
require_relative 'color_namer_ruby/x11'

require_relative 'color_namer_ruby/namer'
require_relative 'color_namer_ruby/distance'

module ColorNamerRuby
  class Error < StandardError; end
  # Your code goes here...
end
