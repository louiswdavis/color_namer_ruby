module ColorNamerRuby
  class Roygbiv
    def self.get_name_from_hex(hex)
      self.colours.select { |swatch| swatch[:hex] == hex.upcase }.first&.dig(:name)
    end

    private

    def self.colours
      [
        { name: 'red', hex: '#FF0000' },
        { name: 'orange', hex: '#FFA500' },
        { name: 'yellow', hex: '#FFFF00' },
        { name: 'green', hex: '#008000' },
        { name: 'blue', hex: '#0000FF' },
        { name: 'indigo', hex: '#4B0082' },
        { name: 'violet', hex: '#EE82EE' },
      ]
    end
  end
end
