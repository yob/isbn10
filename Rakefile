require 'rake'
require 'rspec/core/rake_task'
require 'rdoc/task'

require 'isbn10'

desc "Default: run specs"
task :default => :spec

RSpec::Core::RakeTask.new(:spec)
desc "Run all the specs for ean13"

desc "Generate documentation for the notamock plugin."
Rake::RDocTask.new(:rdoc) do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title    = 'ISBN10'
  rdoc.options << '--line-numbers' << '--inline-source'
  rdoc.rdoc_files.include('README.markdown')
  rdoc.rdoc_files.include('MIT-LICENSE')
  rdoc.rdoc_files.include('CHANGELOG')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
