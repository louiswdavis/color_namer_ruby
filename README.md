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

## Methods

Possible methods:

```ruby
ColorNamerRuby.list_collections
ColorNamerRuby.get_name
ColorNamerRuby.get_names
ColorNamerRuby.get_all_names
ColorNamerRuby.get_colour
ColorNamerRuby.get_colours
ColorNamerRuby.get_all_colours
```

Get a list of the colour collections that can be checked against.

```ruby
ColorNamerRuby.list_collections
=> ['basic', 'html', 'ntc', 'pantone', 'roygbiv', 'x11']
```

Get a single name for a colour using `.get_name` by passing a colour in a way that [ColorConversion]((https://github.com/devrieda/color_conversion)) accepts.
When passing colours with their properties assigned to keys, you need to pass nil or an empty string as the first parameter.

```ruby
ColorNamerRuby.get_name('#3672b4')
=> ['azure']

ColorNamerRuby.get_name('', r: 70, g: 130, b: 180, a: 0.5)
=> ['steelblue']

ColorNamerRuby.get_name('', r: 130, g: 180, b: 70)
=> ['sushi']

ColorNamerRuby.get_name('', h: 20, s: 73, l: 20)
=> ['cioccolato']

ColorNamerRuby.get_name(nil, h: 107, s: 61, v: 71)
=> ['apple']

ColorNamerRuby.get_name(nil, h: 61, s: 71, b: 32)
=> ['camouflage']

ColorNamerRuby.get_name(nil, c: 71, m: 15, y: 5, k: 54)
=> ['blue dianne']

ColorNamerRuby.get_name('rgb(51, 102, 204)')
=> ['denim']

ColorNamerRuby.get_name('hsl(225, 73%, 57%)')
=> ['royalblue']
```

Get a list of colour names sorted by their perceptual similarity to the given color by using `.get_names`.
Again, when passing colours with their properties assigned to keys, you need to pass nil or an empty string as the first parameter.

```ruby
ColorNamerRuby.get_names('#3672b4')
=> ['azure', 'st tropaz', 'denim', 'steelblue', ...]
```

Get a list of all the colour names across the lists that can be checked against.

```ruby
ColorNamerRuby.get_all_names
=> ['black', 'blue', 'cyan', 'green', 'teal', ...]
```

You can also get the entire swatch object(s) to view the hex values and distance the colours are from the source colour you provided. These methods are all related/similar to their 'name' named method counterparts, except they provide the colour hash instead of just the name, and can be called in a similar way too.

When passing colours with their properties assigned to keys, you need to pass nil or an empty string as the first parameter.

```ruby
ColorNamerRuby.get_colour('#3672b4')
=> [{ distance: 8.660254037844387, hex: '#315BA1', name: 'azure' }]
```

Get a list of colour hashes sorted by their perceptual similarity to the given color by using `.get_colours`.
Again, when passing colours with their properties assigned to keys, you need to pass nil or an empty string as the first parameter.

```ruby
ColorNamerRuby.get_colours('#3672b4')
=> [
=>   { distance: 8.660254037844387, hex: '#315BA1', name: 'azure' },
=>   { distance: 9.9498743710662, hex: '#2D569B', name: 'st tropaz' },
=>   { distance: 10.81665382639196, name: 'denim' },
=>   .
=>   .
=>   .
=> ]
```

Get a list of all the colour hashes across the lists that can be checked against.

```ruby
ColorNamerRuby.get_all_colours
=> [
=>   { name: 'black', hex: '#000000', collection: 'basic' },
=>   { name: 'blue', hex: '#0000FF', collection: 'basic' },
=>   { name: 'cyan', hex: '#00FFFF', collection: 'basic' },
=>   .
=>   .
=>   .
=> ]
```

## Options

### pick

This parameter allows you to filter names from the dedicated lists for faster computation.
It can be used for `get_name`, `get_names`, `get_all_names`, or `get_colour`, `get_colours`, `get_all_colours`.

```ruby
ColorNamerRuby.get_names('#3672b4', pick: ['basic', 'x11'])
```

### omit

The opposite of `options.pick`.
It can be used for `get_name`, `get_names`, `get_all_names`, or `get_colour`, `get_colours`, `get_all_colours`.

```ruby
ColorNamerRuby.get_names('#3672b4', omit: ['pantone', 'roygbiv'])
```

### limit

This option allows us to limit the number of names that are returned to keep the returned output manageable.
It can be used for `get_names`, or `get_colours` (since `get_name` and  `get_colour` already have a limit of 1).

```ruby
ColorNamerRuby.get_names('#3672b4', limit: 5)
```

###

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at <https://github.com/louiswdavis/color_namer_ruby>. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/louiswdavis/color_namer_ruby/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the ColorNamerRuby project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/louiswdavis/color_namer_ruby/blob/master/CODE_OF_CONDUCT.md).
