# frozen_string_literal: true

require_relative 'lib/credly/version'

Gem::Specification.new do |spec|
  spec.name = 'credly-ruby'
  spec.version = Credly::VERSION
  spec.required_ruby_version = '>= 2.6.0'
  spec.authors = ['James Ogilvie', 'Elijah Almacen', 'ChanSokphanavy Plean', 'Yahui Qin', 'Shuning Xu']
  spec.summary = 'A Ruby client designed to interface with the Credly API'
  spec.files = Dir['lib/**/*.rb']  # Add your file patterns here
  spec.require_paths = ['lib']
  spec.metadata['rubygems_mfa_required'] = 'true'
end
