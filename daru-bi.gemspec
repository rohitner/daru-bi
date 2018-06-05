lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'daru/bi/version'

Daru::BI::DESCRIPTION = <<MSG.freeze
  Daru-BI is a plugin-gem to Daru gem, which stands for Data Analysis in RUby. Daru-BI extends support for many business analysis and data cleaning methods of Daru::DataFrame. This gem is intended to help Rubyists who are into Data Analysis or Web Development, by serving as a general purpose conversion library,  while also making it incredibly easy to getting started on analyzing data with daru.
MSG

Gem::Specification.new do |spec|
  spec.name          = 'daru-bi'
  spec.version       = Daru::BI::VERSION
  spec.authors       = ['Rohit Ner']
  spec.email         = ['rohitner1@gmail.com']
  spec.summary       = 'Daru-BI is a plugin-gem to Daru gem, which stands for Data Analysis in RUby.'
  spec.description   = Daru::BI::DESCRIPTION
  spec.homepage      = 'https://github.com/rohitner/daru-bi'
  spec.license       = 'MIT'
  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'bin'
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'daru', '~> 0.2.0'
  spec.add_development_dependency 'bundler', '~> 1.15'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'redcarpet'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'rspec-its'
  spec.add_development_dependency 'rubocop', '>= 0.40.0'
  spec.add_development_dependency 'rubocop-rspec'
  spec.add_development_dependency 'rubygems-tasks'
  spec.add_development_dependency 'simplecov'
  spec.add_development_dependency 'webmock'
  spec.add_development_dependency 'yard'
  spec.add_development_dependency 'guard-rspec' if RUBY_VERSION >= '2.2.5'
end
