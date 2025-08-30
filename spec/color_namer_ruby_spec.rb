# frozen_string_literal: true

RSpec.describe ColorNamerRuby do
  it 'has a version number' do
    expect(ColorNamerRuby::VERSION).not_to be nil
  end

  context 'methods' do
    it 'returns list_collections' do
      expect(described_class.list_collections).to eq ['basic', 'html', 'ntc', 'pantone', 'roygbiv', 'x11', 'tailwind_v1', 'tailwind_v2', 'tailwind_v3', 'tailwind_v4']
    end

    it 'returns get_name' do
      expect(described_class.get_name('#3672b4')).to eq(['blue-700'])
      expect(described_class.get_name('', r: 70, g: 130, b: 180, a: 0.5)).to eq(['steelblue'])
      expect(described_class.get_name('', r: 130, g: 180, b: 70)).to eq(['sushi'])
      expect(described_class.get_name('', h: 20, s: 73, l: 20)).to eq(['cioccolato'])
      expect(described_class.get_name(nil, h: 107, s: 61, v: 71)).to eq(['apple'])
      expect(described_class.get_name(nil, h: 61, s: 71, b: 32)).to eq(['camouflage'])
      expect(described_class.get_name(nil, c: 71, m: 15, y: 5, k: 54)).to eq(['teal-700'])
      expect(described_class.get_name('rgb(51, 102, 204)')).to eq(['denim'])
      expect(described_class.get_name('hsl(225, 73%, 57%)')).to eq(['royalblue'])

      expect(described_class.get_name('#3672b4', pick: ['roygbiv'])).to eq(['blue'])
      expect(described_class.get_name('', r: 70, g: 130, b: 180, a: 0.5, omit: ['ntc', 'basic', 'html', 'x11'])).to eq(['blue-800'])
    end

    it 'returns get_names' do
      name_list = described_class.get_names('#ffd700')
      expect(name_list.length).to eq 2664
      expect(name_list.first).to eq 'gold'
      expect(name_list.last).to eq 'opium'

      name_list = described_class.get_names('', r: 130, g: 61, b: 180, omit: ['ntc', 'basic', 'html', 'x11'])
      expect(name_list.length).to eq 783
      expect(name_list.first).to eq 'purple heart'
      expect(name_list.last).to eq 'white'

      name_list = described_class.get_names(nil, h: 61, s: 71, b: 32, pick: ['roygbiv'], limit: 3)
      expect(name_list.length).to eq 3
      expect(name_list.first).to eq 'yellow'
      expect(name_list.last).to eq 'green'
    end

    it 'returns get_all_names' do
      expect(described_class.get_all_names.first).to eq 'black'

      expect(described_class.get_all_names.length).to eq 2664
      expect(described_class.get_all_names(pick: ['roygbiv']).length).to eq 7
      expect(described_class.get_all_names(omit: ['ntc', 'html', 'x11']).length).to eq 804
      expect(described_class.get_all_names(pick: ['ntc'], omit: ['roygbiv', 'basic', 'html', 'x11']).length).to eq 1566
      # expect(described_class.get_all_names(limit: 3).length).to eq 3
    end

    it 'returns get_colour' do
      expect(described_class.get_colour('#3672b4')).to eq([{ distance: 7.615773105863909, hex: '#2B6CB0', name: 'blue-700' }])
      expect(described_class.get_colour('', r: 70, g: 130, b: 180, a: 0.5)).to eq([{ collection: 'html', distance: 0.0, hex: '#4682B4', name: 'steelblue' }])
      expect(described_class.get_colour('', r: 130, g: 180, b: 70)).to eq([{ distance: 10.770329614269007, hex: '#87AB39', name: 'sushi' }])
      expect(described_class.get_colour('', h: 20, s: 73, l: 20)).to eq([{ distance: 3.7416573867739413, hex: '#55280C', name: 'cioccolato' }])
      expect(described_class.get_colour(nil, h: 107, s: 61, v: 71)).to eq([{ distance: 5.830951894845301, hex: '#4FA83D', name: 'apple' }])
      expect(described_class.get_colour(nil, h: 61, s: 71, b: 32)).to eq([{ distance: 8.366600265340756, hex: '#3C3910', name: 'camouflage' }])
      expect(described_class.get_colour(nil, c: 71, m: 15, y: 5, k: 54)).to eq([{ distance: 11.180339887498949, hex: '#2C7A7B', name: 'teal-700' }])
      expect(described_class.get_colour('rgb(51, 102, 204)')).to eq([{ distance: 7.0710678118654755, hex: '#2B6CC4', name: 'denim' }])
      expect(described_class.get_colour('hsl(225, 73%, 57%)')).to eq([{ collection: 'html', distance: 0.0, hex: '#4169E1', name: 'royalblue' }])

      expect(described_class.get_colour('#3672b4', pick: ['roygbiv'])).to eq([{ distance: 54.52522352086234, hex: '#0000FF', name: 'blue' }])
      expect(described_class.get_colour('', r: 70, g: 130, b: 180, a: 0.5, omit: ['ntc', 'basic', 'html', 'x11'])).to eq([{ distance: 16.911534525287763, hex: '#2C5282', name: 'blue-800' }])
    end

    it 'returns get_colours' do
      colour_list = described_class.get_colours('#ffd700')
      expect(colour_list.length).to eq 2664
      expect(colour_list.first).to eq({ distance: 0.0, hex: '#FFD700', name: 'gold' })
      expect(colour_list.last).to eq({ distance: 319.363429340305, hex: '#8E6F70', name: 'opium' })

      colour_list = described_class.get_colours('', r: 130, g: 61, b: 180, omit: ['ntc', 'basic', 'html', 'x11'])
      expect(colour_list.length).to eq 783
      expect(colour_list.first).to eq({ distance: 15.165750888103101, hex: '#7442C8', name: 'purple heart' })
      expect(colour_list.last).to eq({ distance: 284.3149661906668, hex: '#FFFFFF', name: 'white' })

      colour_list = described_class.get_colours(nil, h: 61, s: 71, b: 32, pick: ['roygbiv'], limit: 3)
      expect(colour_list.length).to eq 3
      expect(colour_list.first).to eq({ distance: 53.54437412091022, hex: '#FFFF00', name: 'yellow' })
      expect(colour_list.last).to eq({ distance: 74.31016081263719, hex: '#008000', name: 'green' })
    end

    it 'returns get_all_colours' do
      expect(described_class.get_all_colours.first).to eq({ collection: 'basic', hex: '#000000', name: 'black' })

      expect(described_class.get_all_colours.length).to eq 2664
      expect(described_class.get_all_colours(pick: ['roygbiv']).length).to eq 7
      expect(described_class.get_all_colours(omit: ['basic', 'roygbiv', 'x11']).length).to eq 2489
      expect(described_class.get_all_colours(pick: ['ntc', 'html', 'x11'], omit: ['roygbiv', 'basic', 'x11']).length).to eq 1713
      # expect(described_class.get_all_colours(limit: 3).length).to eq 3
    end
  end
end
