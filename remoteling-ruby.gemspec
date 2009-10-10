# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{remoteling-ruby}
  s.version = "0.0.4"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.2") if s.respond_to? :required_rubygems_version=
  s.authors = ["Adrian Pike"]
  s.date = %q{2009-10-10}
  s.description = %q{Ruby gem for working with Remoteling (http://remoteling.com)}
  s.email = %q{adrian@pikeapps.com}
  s.extra_rdoc_files = ["README.rdoc", "lib/remoteling.rb"]
  s.files = ["Manifest", "README.rdoc", "Rakefile", "lib/remoteling.rb", "test/remoteling_test.rb", "remoteling-ruby.gemspec"]
  s.homepage = %q{http://github.com/adrianpike/remoteling-ruby}
  s.rdoc_options = ["--line-numbers", "--inline-source", "--title", "Remoteling-ruby", "--main", "README.rdoc"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{remoteling-ruby}
  s.rubygems_version = %q{1.3.5}
  s.summary = %q{Ruby gem for working with Remoteling (http://remoteling.com)}
  s.test_files = ["test/remoteling_test.rb"]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
