# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{gettext_test_log}
  s.version = "0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.2") if s.respond_to? :required_rubygems_version=
  s.authors = ["Michael Grosser"]
  s.date = %q{2009-01-27}
  s.description = %q{Logs all gettext translations during test execution, to a updatepo readable format}
  s.email = %q{grosser.michael@gmail.com}
  s.extra_rdoc_files = ["lib/gettext_test_log.rb", "README.markdown"]
  s.files = ["lib/gettext_test_log.rb", "spec/spec_helper.rb", "spec/gettext_test_log_spec.rb", "init.rb", "Rakefile", "README.markdown", "Manifest", "gettext_test_log.gemspec"]
  s.has_rdoc = true
  s.homepage = %q{http://github.com/grosser/gettext_test_log}
  s.rdoc_options = ["--line-numbers", "--inline-source", "--title", "Gettext_test_log", "--main", "README.markdown"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{gettext_test_log}
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{Logs all gettext translations during test execution, to a updatepo readable format}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<echoe>, [">= 0"])
    else
      s.add_dependency(%q<echoe>, [">= 0"])
    end
  else
    s.add_dependency(%q<echoe>, [">= 0"])
  end
end
