Gem::Specification.new do |s|

  s.name            = 'logstash-input-httpfile'
  s.version         = '0.2.0'
  s.licenses        = ['Apache License (2.0)']
  s.summary         = "Stream events from files via http"
  s.description     = "Allows you to watch a log file exposed by Apache alias"
  s.authors         = ["orctom"]
  s.email           = 'orctom@gmail.com'
  s.homepage        = "https://github.com/orctom/logstash-input-httpfile/"
  s.require_paths = ["lib"]

  # Files
  s.files = Dir['lib/**/*','spec/**/*','vendor/**/*','*.gemspec','*.md','CONTRIBUTORS','Gemfile','LICENSE','NOTICE.TXT']

  # Tests
  s.test_files = s.files.grep(%r{^(test|spec|features)/})

  # Special flag to let us know this is actually a logstash plugin
  s.metadata = { "logstash_plugin" => "true", "logstash_group" => "input" }

  # Gem dependencies
  s.add_runtime_dependency "logstash-core", ">= 2.0.0", "< 3.0.0"
  s.add_runtime_dependency 'logstash-codec-multiline', '~> 2.0', '>= 2.0.0'
  s.add_development_dependency 'logstash-devutils', '~> 0.0', '>= 0.0.16'

end

