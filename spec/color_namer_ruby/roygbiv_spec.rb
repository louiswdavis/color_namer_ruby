# frozen_string_literal: true

RSpec.describe ColorNamerRuby::Roygbiv do
  context 'methods' do
    it 'returns get_name_from_hex' do
      expect(described_class.get_name_from_hex('')).to eq nil
      expect(described_class.get_name_from_hex('#FF0000')).to eq 'red'
      expect(described_class.get_name_from_hex('#EE82ee')).to eq 'violet'
      expect(described_class.get_name_from_hex('#008001')).to eq nil
    end

    it 'returns colours' do
      expect(described_class.colours.length).to eq 7
    end
  end
end
