$LOAD_PATH.push File.expand_path('lib', __dir__)
require 'mappd/version'

Gem::Specification.new do |s|
  s.name        = 'mappd_rest'
  s.version     = MappdRest::VERSION
  s.authors     = ['Dan Watson']
  s.email       = ['dan@paz.am']
  s.homepage    = 'https://github.com/dan-watson/mappd-rest'
  s.summary     = 'Mappd Rest is a microframework for exposing ActiveRecord
  models over rest'
  s.description = 'You can expose ActiveRecord objects over REST.'
                  .gsub(/^ {4}/, '')

  s.rubyforge_project = 'mappd_rest'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`
                    .split("\n").map { |f| File.basename(f) }
  s.require_paths = ['lib']

  s.required_ruby_version = '>= 2.6'

  s.add_dependency 'activerecord', '>=6.1.4'
  s.add_dependency 'grape', '>=1.5.3'
  s.add_dependency 'mappd', '>=6.1.4.1'
end
