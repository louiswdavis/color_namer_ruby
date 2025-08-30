# frozen_string_literal: true

require 'color_conversion'
require 'active_support/core_ext/object/blank'
require 'active_support/core_ext/string/inflections'

module ColorNamerRuby
  class Distance
    def self.get_names_from_hex(hex, pick, omit, limit)
      @colour = ColorConversion::Color.new(hex)

      colour_lists = []

      ColorNamerRuby.list_collections.each do |collection_name|
        next unless (pick.empty? || pick.include?(collection_name)) && !omit.include?(collection_name)

        colour_lists += self.get_colour_distances_in_list(Object.const_get("ColorSwatchCollection::#{collection_name.classify}").colours)
      end

      colour_lists = colour_lists.flatten.compact.reject(&:empty?)

      limit = colour_lists.length if limit.negative?

      colour_lists.sort_by { |swatch| swatch[:distance] }.take(limit)
    end

    def self.get_colour_distances_in_list(colour_list)
      colour_list.map do |swatch|
        swatch[:distance] = self.distance_between_colours(ColorConversion::Color.new(swatch.dig(:hex)))
      end

      colour_list
    end

    def self.distance_between_colours(comparison_colour)
      # https://en.wikipedia.org/wiki/Euclidean_distance#Higher_dimensions
      # closest colours across the different arrays
      # TODO use LAB or HCL instead of HSL
      conversion_1 = @colour.hsl
      conversion_2 = comparison_colour.hsl

      Math.sqrt((conversion_1[:h] - conversion_2[:h])**2 + (conversion_1[:s] - conversion_2[:s])**2 + (conversion_1[:l] - conversion_2[:l])**2)
    end
  end
end
