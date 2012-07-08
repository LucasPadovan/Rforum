# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "authlogic"
  s.version = "3.1.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Ben Johnson"]
  s.date = "2012-06-13"
  s.description = "A clean, simple, and unobtrusive ruby authentication solution."
  s.email = ["bjohnson@binarylogic.com"]
  s.homepage = "http://github.com/binarylogic/authlogic"
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.23"
  s.summary = "A clean, simple, and unobtrusive ruby authentication solution."

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<activerecord>, [">= 3.0.0"])
      s.add_runtime_dependency(%q<activesupport>, [">= 3.0.0"])
      s.add_development_dependency(%q<rake>, [">= 0"])
      s.add_development_dependency(%q<bcrypt-ruby>, [">= 0"])
      s.add_development_dependency(%q<sqlite3>, [">= 0"])
    else
      s.add_dependency(%q<activerecord>, [">= 3.0.0"])
      s.add_dependency(%q<activesupport>, [">= 3.0.0"])
      s.add_dependency(%q<rake>, [">= 0"])
      s.add_dependency(%q<bcrypt-ruby>, [">= 0"])
      s.add_dependency(%q<sqlite3>, [">= 0"])
    end
  else
    s.add_dependency(%q<activerecord>, [">= 3.0.0"])
    s.add_dependency(%q<activesupport>, [">= 3.0.0"])
    s.add_dependency(%q<rake>, [">= 0"])
    s.add_dependency(%q<bcrypt-ruby>, [">= 0"])
    s.add_dependency(%q<sqlite3>, [">= 0"])
  end
end
