require 'rake'
require 'rake/gempackagetask'

NAME = "fullfeed"
SUMMARY = "Fullfeed RSS creator"
GEM_VERSION = "0.4.6"

Gem::Specification.new do |s|
  s.name = NAME
  s.summary = s.description = SUMMARY
  s.author = "siuying"
  s.email = "siu.ying@gmail.com"
  s.version = GEM_VERSION
  s.platform = Gem::Platform::RUBY
  s.require_path = 'lib'
  s.files       =  %w(README Rakefile) + Dir.glob("{examples,lib,test}/**/*")
  
  #   s.executables = ["rackup"]
  s.add_dependency('ruby-cache', '>= 0.3.0')
  s.add_dependency('hpricot',    '>= 0.6.1')
end