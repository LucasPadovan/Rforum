# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "bbcoder"
  s.version = "1.0.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["John 'asceth' Long"]
  s.date = "2012-04-13"
  s.description = "A gem for parsing bbcode that doesn't rely on regular expressions"
  s.email = ["machinist@asceth.com"]
  s.homepage = "http://github.com/asceth/bbcoder"
  s.require_paths = ["lib"]
  s.rubyforge_project = "bbcoder"
  s.rubygems_version = "1.8.23"
  s.summary = "BBCode parser"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rspec>, [">= 0"])
      s.add_development_dependency(%q<rr>, [">= 0"])
    else
      s.add_dependency(%q<rspec>, [">= 0"])
      s.add_dependency(%q<rr>, [">= 0"])
    end
  else
    s.add_dependency(%q<rspec>, [">= 0"])
    s.add_dependency(%q<rr>, [">= 0"])
  end
end
