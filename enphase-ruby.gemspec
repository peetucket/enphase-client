Gem::Specification.new do |s|
  s.name        = 'enphase-ruby'
  s.version     = '0.0.1'
  s.summary     = "A Ruby gem wrapper for the Enphase Enlighten Systems API"
  s.description = "See https://developer.enphase.com/ for information on how to get an API key and authorize access for a user."
  s.authors     = ["Peter Mangiafico"]
  s.email       = 'peter@mangiafico.org'
  s.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  s.add_dependency 'faraday'
  s.add_dependency 'json'

  s.homepage    =
    'https://rubygems.org/gems/enphase-ruby'
  s.license       = 'MIT'
end
