# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "pg"
  s.version = "0.13.2"
  s.platform = "x86-mingw32"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Michael Granger"]
  s.date = "2012-02-23"
  s.description = "Pg is the Ruby interface to the {PostgreSQL RDBMS}[http://www.postgresql.org/].\n\nIt works with {PostgreSQL 8.3 and later}[http://bit.ly/6AfPhm].\n\nA small example usage:\n\n  #!/usr/bin/env ruby\n  \n  require 'pg'\n  \n  # Output a table of current connections to the DB\n  conn = PG.connect( dbname: 'sales' )\n  conn.exec( \"SELECT * FROM pg_stat_activity\" ) do |result|\n    puts \"     PID | User             | Query\"\n\tresult.each do |row|\n      puts \" %7d | %-16s | %s \" %\n        row.values_at('procpid', 'usename', 'current_query')\n    end\n  end"
  s.email = ["ged@FaerieMUD.org"]
  s.extra_rdoc_files = ["Manifest.txt", "README.rdoc", "README-Windows.rdoc", "Contributors.rdoc", "README-OS_X.rdoc", "History.rdoc", "README.ja.rdoc", "POSTGRES", "LICENSE", "ext/pg.c", "ext/pg_connection.c", "ext/pg_result.c"]
  s.files = ["Manifest.txt", "README.rdoc", "README-Windows.rdoc", "Contributors.rdoc", "README-OS_X.rdoc", "History.rdoc", "README.ja.rdoc", "POSTGRES", "LICENSE", "ext/pg.c", "ext/pg_connection.c", "ext/pg_result.c"]
  s.homepage = "https://bitbucket.org/ged/ruby-pg"
  s.licenses = ["BSD", "Ruby", "GPL"]
  s.rdoc_options = ["--main", "README.rdoc"]
  s.require_paths = ["lib"]
  s.required_ruby_version = Gem::Requirement.new(">= 1.8.7")
  s.rubyforge_project = "pg"
  s.rubygems_version = "1.8.23"
  s.summary = "Pg is the Ruby interface to the {PostgreSQL RDBMS}[http://www.postgresql.org/]"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<hoe-mercurial>, ["~> 1.3.1"])
      s.add_development_dependency(%q<rake-compiler>, ["~> 0.7"])
      s.add_development_dependency(%q<rspec>, ["~> 2.6"])
      s.add_development_dependency(%q<hoe>, ["~> 2.12"])
      s.add_development_dependency(%q<rdoc>, ["~> 3.10"])
    else
      s.add_dependency(%q<hoe-mercurial>, ["~> 1.3.1"])
      s.add_dependency(%q<rake-compiler>, ["~> 0.7"])
      s.add_dependency(%q<rspec>, ["~> 2.6"])
      s.add_dependency(%q<hoe>, ["~> 2.12"])
      s.add_dependency(%q<rdoc>, ["~> 3.10"])
    end
  else
    s.add_dependency(%q<hoe-mercurial>, ["~> 1.3.1"])
    s.add_dependency(%q<rake-compiler>, ["~> 0.7"])
    s.add_dependency(%q<rspec>, ["~> 2.6"])
    s.add_dependency(%q<hoe>, ["~> 2.12"])
    s.add_dependency(%q<rdoc>, ["~> 3.10"])
  end
end
