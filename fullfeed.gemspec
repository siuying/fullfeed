NAME = "fullfeed"
SUMMARY = "Fullfeed RSS creator"
GEM_VERSION = "0.2.0"

Gem::Specification.new do |s|
  s.name = NAME
  s.summary = s.description = SUMMARY
  s.author = "siuying"
  s.email = "siu.ying@gmail.com"
  s.version = GEM_VERSION
  s.platform = Gem::Platform::RUBY
  s.require_path = 'lib'
  s.files = %w(Rakefile) + Dir.glob("lib/**/*") + Dir.glob("examples/**/*")

  s.add_dependency('ruby-cache', '>= 0.3.0')
  s.add_dependency('nokogiri',   '>= 1.2.3')
end