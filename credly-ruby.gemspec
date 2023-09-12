# frozen_string_literal: true

Gem::Specification.new do |spec|
  spec.name = 'credly-ruby'
  spec.version = '0.0.1'
  spec.authors = ['James Ogilvie', 'Elijah Almacen', 'ChanSokphanavy Plean', 'Yahui Qin', 'Shuning Xu']
  spec.summary = 'A Ruby client designed to interface with the Credly API'
  spec.add_dependency 'faraday'
  spec.add_development_dependency 'faraday'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'webmock'
  spec.files = Dir['lib/**/*.rb']  # Add your file patterns here
  spec.require_paths = ['lib']
end
