# frozen_string_literal: true

RSpec.describe ColorNamerRuby::Html do
  context 'methods' do
    it 'returns get_name_from_hex' do
      expect(described_class.get_name_from_hex('')).to eq nil
      expect(described_class.get_name_from_hex('#1E90FF')).to eq 'dodgerblue'
      expect(described_class.get_name_from_hex('#3cb371')).to eq 'mediumseagreen'
      expect(described_class.get_name_from_hex('#ffd710')).to eq nil
    end

    it 'returns colours' do
      expect(described_class.colours.length).to eq 147
    end
  end
end
