Gem::Specification.new do |spec|
  spec.name = "isbn10"
  spec.version = "1.1.0"
  spec.summary = "a (very) small library for working with ISBN10 codes"
  spec.description = "a (very) small library for working with ISBN10 codes"
  spec.license = "MIT"
  spec.author = "James Healy"
  spec.email = "jimmy@deefa.com"
  spec.homepage = "http://github.com/yob/isbn10"
  spec.has_rdoc = true
  spec.rdoc_options << "--title" << "ISBN10" << "--line-numbers"

  spec.required_ruby_version = ">=1.9.3"

  spec.test_files = Dir.glob("spec/**/*_spec.rb")
  spec.files = Dir.glob("lib/**/*.rb") + ["MIT-LICENSE", "README.rdoc", "CHANGELOG" ]

  spec.add_dependency("ean13")
  spec.add_development_dependency("rake")
  spec.add_development_dependency("rspec", "~> 3.0")
end
