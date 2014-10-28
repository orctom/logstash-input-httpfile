Gem::Specification.new do |s|

  s.name            = 'logstash-input-httpfile'
  s.version         = '0.1.0'
  s.licenses        = ['Apache License (2.0)']
  s.summary         = "Stream events from files via http"
  s.description     = "Stream events from files via http"
  s.authors         = ["orctom"]
  s.email           = 'orctom@gmail.com'
  s.homepage        = "https://github.com/orctom/logstash-input-httpfile/"
  s.require_paths = ["lib"]

  # Files
  s.files = `git ls-files`.split($\)+::Dir.glob('vendor/*')

  # Tests
  s.test_files = s.files.grep(%r{^(test|spec|features)/})

  # Special flag to let us know this is actually a logstash plugin
  s.metadata = { "logstash_plugin" => "true", "group" => "input" }

  # Gem dependencies
  s.add_runtime_dependency 'logstash', '>= 1.4.0', '< 2.0.0'

  s.add_runtime_dependency 'logstash-codec-multiline'

end

