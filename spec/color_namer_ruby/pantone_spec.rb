# frozen_string_literal: true

RSpec.describe ColorNamerRuby::Pantone do
  context 'methods' do
    it 'returns get_name_from_hex' do
      expect(described_class.get_name_from_hex('#FDBCB4')).to eq 'Melon'
      expect(described_class.get_name_from_hex('#ffa474')).to eq 'Atomic Tangerine'
      expect(described_class.get_name_from_hex('#FAA7B4')).to eq nil
    end
  
    it 'returns colours' do
      expect(described_class.colours.length).to eq 120
    end
  end
end
