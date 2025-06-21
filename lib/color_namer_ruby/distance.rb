require 'color_conversion'
require 'active_support/core_ext/object/blank'

module ColorNamerRuby
  class Distance
    def self.get_names_from_hex(hex, pick, omit, limit)
      @colour = ColorConversion::Color.new(hex)

      colour_lists = []

      ColorNamerRuby::Namer.list_names.each do |list_name|
        if (pick.empty? || pick.include?(list_name)) && !omit.include?(list_name)
          colour_lists += self.get_colour_distances_in_list(Object.const_get("ColorNamerRuby::#{list_name.capitalize}").colours)
        end
      end

      colour_lists = colour_lists.flatten.compact.reject(&:empty?)

      limit = colour_lists.length if limit < 0
      
      colour_lists.sort_by { |swatch| swatch[:distance] }.take(limit)
    end
    
    private

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
      hsl_1 = @colour.hsl
      hsl_2 = comparison_colour.hsl
      
      Math.sqrt((hsl_1[:h] - hsl_2[:h])**2 + (hsl_1[:s] - hsl_2[:s])**2 + (hsl_1[:l] - hsl_2[:l])**2)
    end
  end
end
