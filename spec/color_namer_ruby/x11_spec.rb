# frozen_string_literal: true

RSpec.describe ColorNamerRuby::X11 do
  context 'methods' do
    it 'returns get_name_from_hex' do
      expect(described_class.get_name_from_hex('')).to eq nil
      expect(described_class.get_name_from_hex('#4b0082')).to eq 'indigo'
      expect(described_class.get_name_from_hex('#FFDeAd')).to eq 'navajowhite'
      expect(described_class.get_name_from_hex('#2f4f3f')).to eq nil
    end

    it 'returns colours' do
      expect(described_class.colours.length).to eq 147
    end
  end
end
