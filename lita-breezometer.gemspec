Gem::Specification.new do |spec|
  spec.name          = 'lita-breezometer'
  spec.version       = '0.0.0'
  spec.authors       = ['jaythomas']
  spec.email         = ['jay@gfax.ch']
  spec.description   = 'Breezometer adapter for Lita bot.'
  spec.summary       = 'Breezometer adapter for Lita bot.'
  spec.homepage      = 'https://github.com/gfax/lita-breezometer'
  spec.license       = 'LGPL-3.0'
  spec.metadata      = { 'lita_plugin_type' => 'handler' }

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'lita', '>= 4.7'
  spec.add_runtime_dependency 'rest-client', '>= 1.8.0'

  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'pry-byebug'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rack-test', '>= 0.6.3'
  spec.add_development_dependency 'rspec', '>= 3.0.0'
  spec.add_development_dependency 'simplecov', '>= 0.11.0'
  spec.add_development_dependency 'coveralls', '>= 0.8.10'
end
