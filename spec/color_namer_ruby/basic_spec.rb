# frozen_string_literal: true

RSpec.describe ColorNamerRuby::Basic do
  context 'methods' do
    it 'returns get_name_from_hex' do
      expect(described_class.get_name_from_hex('#ffd700')).to eq 'gold'
      expect(described_class.get_name_from_hex('#FFC0CB')).to eq 'pink'
      expect(described_class.get_name_from_hex('#ffd710')).to eq nil
    end
  
    it 'returns colours' do
      expect(described_class.colours.length).to eq 21
    end
  end
end
