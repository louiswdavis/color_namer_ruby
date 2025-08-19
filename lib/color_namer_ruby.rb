# frozen_string_literal: true

require 'color_swatch_collection'

require_relative 'color_namer_ruby/version'
require_relative 'color_namer_ruby/distance'

module ColorNamerRuby
  class Error < StandardError; end

  def self.list_collections
    ColorSwatchCollection.list_collections
  end

  def self.get_name(colour_value, pick: [], omit: [], **alt_colour_value)
    self.get_colour(colour_value, pick: pick, omit: omit, **alt_colour_value).map { |h| h[:name] } || []
  end

  def self.get_names(colour_value, pick: [], omit: [], limit: -1, **alt_colour_value)
    self.get_colours(colour_value, pick: pick, omit: omit, limit: limit, **alt_colour_value).map { |h| h[:name] } || []
  end

  def self.get_all_names(pick: [], omit: [])
    self.get_all_colours(pick: pick, omit: omit).map { |h| h[:name] } || []
  end

  def self.get_colour(colour_value, pick: [], omit: [], **alt_colour_value)
    # alt_colour_value are used to collect colour paramaters when they are passed in the key format
    hex = ColorConversion::Color.new(colour_value.presence || alt_colour_value).hex

    # if we get an exact match, return it
    colour = self.get_colour_from_collections(hex, pick, omit)

    if colour.present?
      colour[:distance] = 0.0
      return [colour]
    end

    # if we don't get an exact match, try to find the closest match
    ColorNamerRuby::Distance.get_names_from_hex(hex, pick, omit, 1)
  end

  def self.get_colours(colour_value, pick: [], omit: [], limit: -1, **alt_colour_value)
    hex = ColorConversion::Color.new(colour_value.presence || alt_colour_value).hex

    # get the closest matches up to the count limit
    ColorNamerRuby::Distance.get_names_from_hex(hex, pick, omit, limit)
  end

  # if the same names appear in multiple lists, they could still appear even if certain lists they are in are omitted
  def self.get_all_colours(pick: [], omit: [])
    ColorSwatchCollection.get_colours(pick: pick, omit: omit)
  end

  private

  def self.get_colour_from_collections(hex, pick, omit)
    colour = nil

    self.list_collections.each do |collection_name|
      next unless (pick.empty? || pick.include?(collection_name)) && !omit.include?(collection_name)

      colour = ColorSwatchCollection.get_from_hex(hex, pick: [collection_name])

      break if colour.present?
    end

    colour || {}
  end
end
