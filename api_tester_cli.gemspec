Gem::Specification.new do |spec|
  spec.name          = 'api-tester-cli'
  spec.version       = '0.0.0'
  spec.summary       = 'A CLI tool to test APIs'
  spec.description   = 'This tool allows users to interactively test APIs via the command line.'
  spec.authors       = ['Bhavyansh Yadav']
  spec.email         = 'bhavyansh001@gmail.com'
  spec.files         = Dir['lib/**/*', 'bin/api-tester', 'README.md']
  spec.executables   = ['api-tester']
  spec.require_paths = ['lib']
  spec.homepage      = "https://rubygems.org/gems/api_tester"
  spec.license       = "MIT"

  spec.required_ruby_version = ">= 3.3.0"
  spec.metadata = {
    "source_code_uri" => "https://github.com/bhavyansh001/api_tester",
    "issue_tracker_uri" => "https://github.com/bhavyansh001/api_tester/issues"
  }

  spec.require_paths = ["lib"]

  spec.add_dependency 'json', "~> 2.7.2"
  spec.add_dependency 'colorize', "~> 1.1.0"
  spec.add_dependency 'terminal-table', "~> 3.0.2"
  spec.add_development_dependency "rspec", "~> 3.13.0"
end
