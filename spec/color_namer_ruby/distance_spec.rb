# frozen_string_literal: true

RSpec.describe ColorNamerRuby::Distance do
  context 'methods' do
    it 'returns get_names_from_hex' do
      colour_list = described_class.get_names_from_hex('#ffd700', [], [], -1)
      expect(colour_list.length).to eq 2664
      expect(colour_list.first).to eq({ distance: 0.0, hex: '#FFD700', name: 'gold' })
      expect(colour_list.last).to eq({ distance: 319.363429340305, hex: '#8E6F70', name: 'opium' })

      colour_list = described_class.get_names_from_hex('#FFC0CB', ['basic', 'html', 'pantone'], [], -1)
      expect(colour_list.length).to eq 288
      expect(colour_list.first).to eq({ distance: 0.0, hex: '#FFC0CB', name: 'pink' })
      expect(colour_list.last).to eq({ distance: 374.49165544775497, hex: '#000000', name: 'black' })

      colour_list = described_class.get_names_from_hex('#0055ff', [], ['ntc', 'roygbiv'], -1)
      expect(colour_list.length).to eq 1091
      expect(colour_list.first).to eq({ distance: 4.358898943540674, hex: '#155CFB', name: 'blue-600' })
      expect(colour_list.last).to eq({ distance: 246.77925358506133, hex: '#000000', name: 'black' })

      colour_list = described_class.get_names_from_hex('#001625', ['basic', 'ntc', 'roygbiv'], ['ntc', 'pantone'], -1)
      expect(colour_list.length).to eq 28
      expect(colour_list.first).to eq({ distance: 30.0, hex: '#008080', name: 'teal' })
      expect(colour_list.last).to eq({ distance: 245.48930730278255, hex: '#FFFFFF', name: 'white' })

      colour_list = described_class.get_names_from_hex('#011D15', [], [], 23)
      expect(colour_list.length).to eq 23
      expect(colour_list.first).to eq({ distance: 4.0, hex: '#011D13', name: 'holly' })
      expect(colour_list.last).to eq({ distance: 18.788294228055936, hex: '#042F2E', name: 'teal-950' })
    end
  end
end
