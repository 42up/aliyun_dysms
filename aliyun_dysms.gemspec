require_relative 'lib/aliyun_dysms/version'

Gem::Specification.new do |spec|
  spec.name          = "aliyun_dysms_sdk"
  spec.version       = AliyunDysms::VERSION
  spec.authors       = ["42up"]
  spec.email         = ["foobar@v2up.com"]

  spec.summary       = "aliyun dysms sdk"
  spec.description   = "aliyun dysms sdk"
  spec.homepage      = "https://github.com/42up/aliyun_dysms"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  # spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["changelog_uri"] = spec.homepage

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "aliyunsdkcore"

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end
