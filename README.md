# Color Namer Ruby

> Give me a color and I'll name it.

Color Namer Ruby is an ruby gem package for use in ruby or other projects that provides names for colours based on calculated color distances using the [Delta-E](http://www.colorwiki.com/wiki/Delta_E%3a_The_Color_Difference) color difference technique.
Given a color in [Hexadecimal, RGA(A), HSL(A), HSV, HSB, or CMYK format](https://github.com/devrieda/color_conversion), it converts the color to the [HSL color space](https://en.wikipedia.org/wiki/HSL_and_HSV) (for now),
then calculates the color's [Euclidean distance](https://npmjs.org/package/euclidean-distance) from a set of colors with known names to find the closest matching colour and it's name.

Mike Bostock of [D3](http://d3js.org/) fame [explains it well](https://gist.github.com/mbostock/3014589):

> Lab and HCL color spaces are special in that the perceived difference between two colors is proportional to their Euclidean distance in color space. This special property, called perceptual uniformity, makes them ideal for accurate visual encoding of data. In contrast, the more familiar RGB and HSL color spaces distort data when used for visualization.

## Lists

The color names are derived from several lists:

- [roygbiv](lib/color_namer_rails/roygbiv.rb)
- [basic](lib/color_namer_rails/basic.rb)
- [html](lib/color_namer_rails/html.rb) - the HTML color names.
- [x11](lib/color_namer_rails/x11.rb) - The list that preceded the HTML color names
- [pantone](lib/color_namer_rails/pantone.rb)
- [ntc](lib/color_namer_rails/ntc.rb), an [astounding collection](http://chir.ag/projects/ntc/) of over 1500 named colors.

## Installation

Install the gem and add to the application's Gemfile by executing:

```bash
bundle add color_name_ruby
```

If bundler is not being used to manage dependencies, install the gem by executing:

```bash
gem install color_name_ruby
```

## Usage

Get a single name for a colour using `.get_name` by passing a colour in a way that [ColorConversion]((https://github.com/devrieda/color_conversion)) accepts.
When passing colours with their properties assigned to keys, you need to pass nil or an empty string as the first parameter.

```ruby
ColorNamerRuby::Namer.get_name('#3672b4')
=> 'Azure'

ColorNamerRuby::Namer.get_name('', r: 70, g: 130, b: 180, a: 0.5)
=> 'steelblue'

ColorNamerRuby:Namer.get_name('', r: 130, g: 180, b: 70)
=> 'Sushi'

ColorNamerRuby:Namer.get_name('', h: 20, s: 73, l: 20)
=> 'Cioccolato'

ColorNamerRuby:Namer.get_name(nil, h: 107, s: 61, v: 71)
=> 'Apple'

ColorNamerRuby::Namer.get_name(nil, h: 61, s: 71, b: 32)
=> 'Camouflage'

ColorNamerRuby::Namer.get_name(nil, c: 71, m: 15, y: 5, k: 54)
=> 'Blue Dianne'

ColorNamerRuby::Namer.get_name('rgb(51, 102, 204)')
=> 'Denim'

ColorNamerRuby::Namer.get_name('hsl(225, 73%, 57%)')
=> 'royalblue'
```

Get a list of colour names sorted by their perceptual similarity to the given color by using `.get_names`.
Again, when passing colours with their properties assigned to keys, you need to pass nil or an empty string as the first parameter.

```ruby
ColorNamerRuby::Namer.get_names('#3672b4')
=> [
=>   { name: 'Azure', hex: '#315BA1', distance: 8.660254037844387 },
=>   { name: 'St Tropaz', hex: '#2D569B', distance: 9.9498743710662 },
=>   { name: 'Denim', hex: '#2B6CC4', distance: 10.816653826391969 },
=>   { name: 'steelblue', hex: '#4682B4', distance: 11.180339887498949 },
=>   { name: 'Steel Blue', hex: '#4682B4', distance: 11.180339887498949 },
=>   .
=>   .
=>   .
=> ]
```

Get a list of the colour lists that can be checked against.

```ruby
ColorNamerRuby::Namer.list_names
=> ['basic', 'html', 'ntc', 'pantone', 'roygbiv', 'x11']
```

## Options

### pick

This parameter allows you to filter names from the dedicated lists for faster computation.
It can be used for both `get_name` and `get_names`.

```ruby
ColorNamerRuby::Namer.get_names('#3672b4', pick: ['basic', 'x11'])
```

### omit

The opposite of `options.pick`.
It can be used for both `get_name` and `get_names`.

```ruby
ColorNamerRuby::Namer.get_names('#3672b4', omit: ['pantone', 'roygbiv'])
```

### limit

This option allows us to limit the number of names that are returned to keep the returned output manageable.
It can be used for `get_names` (since `get_name` already has a limit of 1).

```ruby
ColorNamerRuby::Namer.get_names('#3672b4', limit: 5)
```

###

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at <https://github.com/[USERNAME]/color_namer_ruby>. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/[USERNAME]/color_namer_ruby/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the ColorNamerRuby project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/color_namer_ruby/blob/master/CODE_OF_CONDUCT.md).
