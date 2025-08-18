# frozen_string_literal: true

require 'color_conversion'
require 'active_support/core_ext/object/blank'

module ColorNamerRuby
  class Namer
    def self.get_name(colour_value, pick: [], omit: [], **alt_colour_value)
      # alt_colour_value are used to collect colour paramaters when they are passed in the key format
      @hex = ColorConversion::Color.new(colour_value.presence || alt_colour_value).hex

      name = self.check_lists(pick, omit)
      return name if name.present?

      name_object = ColorNamerRuby::Distance.get_names_from_hex(@hex, pick, omit, 1).first
      name_object.dig(:name)
    end

    def self.get_names(colour_value, pick: [], omit: [], limit: -1, **alt_colour_value)
      @hex = ColorConversion::Color.new(colour_value.presence || alt_colour_value).hex

      ColorNamerRuby::Distance.get_names_from_hex(@hex, pick, omit, limit)
    end

    def self.list_names
      %w[basic html ntc pantone roygbiv x11]
    end

    def self.get_all_color_names(pick: [], omit: [])
      ColorNamerRuby::Namer.list_names.collect do |list_name|
        next unless (pick.empty? || pick.include?(list_name)) && !omit.include?(list_name)

        Object.const_get("ColorNamerRuby::#{list_name.capitalize}").colours.map { |hash| hash[:name] }
      end.flatten.uniq.sort
    end

    def self.check_lists(pick, omit)
      name = nil

      self.list_names.each do |list_name|
        next unless (pick.empty? || pick.include?(list_name)) && !omit.include?(list_name)

        name = Object.const_get("ColorNamerRuby::#{list_name.capitalize}").get_name_from_hex(@hex)

        break if name.present?
      end

      name || ''
    end
  end
end
