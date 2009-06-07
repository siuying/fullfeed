require "rubygems"
require "pathname"
require "rake"
require "rake/testtask"

# Gem
require "rake/gempackagetask"

NAME = "fullfeed"
SUMMARY = "Fullfeed RSS creator"
GEM_VERSION = "0.4.4"

spec = Gem::Specification.new do |s|
  s.name = NAME
  s.summary = s.description = SUMMARY
  s.author = "siuying"
  s.email = "siu.ying@gmail.com"
  s.version = GEM_VERSION
  s.platform = Gem::Platform::RUBY
  s.require_path = 'lib'
  s.files = %w(Rakefile) + Dir.glob("lib/**/*") + Dir.glob("examples/**/*")

  s.add_dependency('ruby-cache', '>= 0.3.0')
  s.add_dependency('hpricot',    '>= 0.6.1')
end

Rake::GemPackageTask.new(spec) do |pkg|
  pkg.gem_spec = spec
end

desc "Install the FullFeed as a gem"
task :install => [:repackage] do
  sh %{gem install pkg/#{spec.name}-#{spec.version}}
end