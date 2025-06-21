# frozen_string_literal: true

RSpec.describe ColorNamerRuby::Namer do
  context 'methods' do
    it 'returns get_name' do
      expect(described_class.get_name('#3672b4')).to eq 'Azure'
      expect(described_class.get_name('', r: 70, g: 130, b: 180, a: 0.5)).to eq 'steelblue'
      expect(described_class.get_name('', r: 130, g: 180, b: 70)).to eq 'Sushi'
      expect(described_class.get_name('', h: 20, s: 73, l: 20)).to eq 'Cioccolato'
      expect(described_class.get_name(nil, h: 107, s: 61, v: 71)).to eq 'Apple'
      expect(described_class.get_name(nil, h: 61, s: 71, b: 32)).to eq 'Camouflage'
      expect(described_class.get_name(nil, c: 71, m: 15, y: 5, k: 54)).to eq 'Blue Dianne'
      expect(described_class.get_name('rgb(51, 102, 204)')).to eq 'Denim'
      expect(described_class.get_name('hsl(225, 73%, 57%)')).to eq 'royalblue'

      expect(described_class.get_name('#3672b4', pick: ['roygbiv'])).to eq 'blue'
      expect(described_class.get_name('', r: 70, g: 130, b: 180, a: 0.5, omit: ['ntc', 'basic', 'html', 'x11'])).to eq 'Denim'
    end
  
    it 'returns get_names' do
      colour_list = described_class.get_names('#ffd700')
      expect(colour_list.length).to eq 2008
      expect(colour_list.first).to eq({ distance: 0.0, hex: '#FFD800', name: 'School bus Yellow' })
      expect(colour_list.last).to eq({ distance: 319.363429340305, hex: '#8E6F70', name: 'Opium' })

      colour_list = described_class.get_names('', r: 130, g: 61, b: 180, omit: ['ntc', 'basic', 'html', 'x11'])
      expect(colour_list.length).to eq 127
      expect(colour_list.first).to eq({ distance: 15.165750888103101, hex: '#7442C8', name: 'Purple Heart' })
      expect(colour_list.last).to eq({ distance: 283.09362408927547, hex: '#EDEDED', name: 'White' })

      colour_list = described_class.get_names(nil, h: 61, s: 71, b: 32, pick: ['roygbiv'], limit: 3)
      expect(colour_list.length).to eq 3
      expect(colour_list.first).to eq({ distance: 53.54437412091022, hex: '#FFFF00', name: 'yellow' })
      expect(colour_list.last).to eq({ distance: 74.31016081263719, hex: '#008000', name: 'green' })
    end

    it 'returns list_names' do
      expect(described_class.list_names).to eq ['basic', 'html', 'ntc', 'pantone', 'roygbiv', 'x11']
    end
  end
end
