# frozen_string_literal: true

require_relative 'lib/tic_tac_toe_master/version'

Gem::Specification.new do |spec|
  spec.name = 'tic_tac_toe_master'
  spec.version = TicTacToeMaster::VERSION
  spec.authors = ['Vitalii Matseiko']
  spec.email = ['realnatisk@gmail.com']

  spec.summary = 'A simple Tic Tac Toe game implemented in Ruby.'
  spec.description = 'TicTacToeMaster is a gem that allows you to play Tic Tac Toe in the console.'
  spec.homepage = 'https://github.com/Natisk/tic_tac_toe_master'
  spec.license = 'MIT'
  spec.required_ruby_version = '>= 3.0.0'

  spec.metadata['allowed_push_host'] = 'https://rubygems.org'

  spec.metadata['homepage_uri'] = spec.homepage

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.glob('lib/**/*.rb') + Dir.glob('bin/*')
  spec.executables = Dir.glob('bin/*').map { |f| File.basename(f) }
  spec.bindir = 'bin'

  spec.require_paths = ['lib']
end
