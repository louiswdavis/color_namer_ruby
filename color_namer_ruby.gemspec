# frozen_string_literal: true

require_relative 'lib/color_namer_ruby/version'

Gem::Specification.new do |spec|
  spec.name = 'color_namer_ruby'
  spec.version = ColorNamerRuby::VERSION
  spec.authors = ['Louis Davis']
  spec.email = ['LouisWilliamDavis@gmail.com']

  spec.summary = "Give me a color and I'll name it."
  spec.description = 'Provide a color in a variety of formats and get a name back based on a range of colour options and see how closely they match your color.'
  spec.homepage = 'https://github.com/louiswdavis/color_namer_ruby'
  spec.license = 'MIT'
  spec.required_ruby_version = '>= 3.1.0'

  # spec.metadata['allowed_push_host'] = "TODO: Set to your gem server 'https://example.com'"

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/louiswdavis/color_namer_ruby'
  spec.metadata['changelog_uri'] = 'https://github.com/louiswdavis/color_namer_ruby/blob/master/CHANGELOG.md'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  # gemspec = File.basename(__FILE__)
  # spec.files = IO.popen(%w[git ls-files -z], chdir: __dir__, err: IO::NULL) do |ls|
  #   ls.readlines("\x0", chomp: true).reject do |f|
  #     (f == gemspec) ||
  #       f.start_with?(*%w[bin/ test/ spec/ features/ .git appveyor Gemfile])
  #   end
  # end
  # spec.bindir = 'exe'
  # spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  # spec.require_paths = ['lib']

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    Dir['{lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.md']
  end

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency 'example-gem', '~> 1.0'
  spec.add_dependency 'activesupport'
  spec.add_dependency 'color_conversion', '~> 0.1.2'

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
