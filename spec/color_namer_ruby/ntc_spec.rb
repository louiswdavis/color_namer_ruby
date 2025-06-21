# frozen_string_literal: true

RSpec.describe ColorNamerRuby::Ntc do
  context 'methods' do
    it 'returns get_name_from_hex' do
      expect(described_class.get_name_from_hex('#002E20')).to eq 'Burnham'
      expect(described_class.get_name_from_hex('#007fff')).to eq 'Azure Radiance'
      expect(described_class.get_name_from_hex('#016AA7')).to eq nil
    end
  
    it 'returns colours' do
      expect(described_class.colours.length).to eq 1566
    end
  end
end
