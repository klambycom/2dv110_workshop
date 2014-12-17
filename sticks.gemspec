# coding: utf-8

lib = File.expand_path('../lib/', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name           = 'Idk'
  spec.version        = '1.0'
  spec.authors        = ['Christian Nilsson']
  spec.email          = ['christian@klamby.com']
  spec.summary        = %q{TODO}
  spec.description    = %q{TODO}
  spec.homepage       = ''
  spec.license        = 'MIT'

  #spec.add_dependency 'colorize'

  spec.add_development_dependency 'minitest'
  spec.add_development_dependency 'guard-minitest'
  #spec.add_development_dependency 'simplecov'
  spec.add_development_dependency 'mocha'

  spec.files          = Dir.glob('lib/*.rb')
  spec.executables    = ['workshop']
  spec.test_files     = Dir.glob('test/*.rb')
  spec.require_paths  = 'lib'
end
