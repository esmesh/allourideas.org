# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "friendly_id"
  s.version = "2.2.5"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Norman Clarke", "Adrian Mugnolo", "Emilio Tagua"]
  s.date = "2009-11-29"
  s.description = "A comprehensive slugging and pretty-URL plugin for Rails apps using ActiveRecord."
  s.email = ["norman@njclarke.com", "adrian@mugnolo.com", "miloops@gmail.com"]
  s.extra_rdoc_files = ["History.txt", "README.rdoc"]
  s.files = ["History.txt", "README.rdoc"]
  s.homepage = "http://friendly-id.rubyforge.org/"
  s.post_install_message = "\n***********************************************************\n\n  If you are upgrading friendly_id, please run\n\n      ./script/generate friendly_id --skip-migration\n\n  in your Rails application to ensure that you have the\n  latest friendly_id Rake tasks.\n\n***********************************************************\n\n"
  s.rdoc_options = ["--main", "README.rdoc"]
  s.require_paths = ["lib"]
  s.rubyforge_project = "friendly-id"
  s.rubygems_version = "1.8.23.2"
  s.summary = "A comprehensive slugging and pretty-URL plugin for ActiveRecord."

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<activerecord>, [">= 2.2.3"])
      s.add_runtime_dependency(%q<activesupport>, [">= 2.2.3"])
      s.add_development_dependency(%q<newgem>, [">= 1.5.2"])
      s.add_development_dependency(%q<sqlite3-ruby>, [">= 0"])
      s.add_development_dependency(%q<hoe>, [">= 2.3.3"])
    else
      s.add_dependency(%q<activerecord>, [">= 2.2.3"])
      s.add_dependency(%q<activesupport>, [">= 2.2.3"])
      s.add_dependency(%q<newgem>, [">= 1.5.2"])
      s.add_dependency(%q<sqlite3-ruby>, [">= 0"])
      s.add_dependency(%q<hoe>, [">= 2.3.3"])
    end
  else
    s.add_dependency(%q<activerecord>, [">= 2.2.3"])
    s.add_dependency(%q<activesupport>, [">= 2.2.3"])
    s.add_dependency(%q<newgem>, [">= 1.5.2"])
    s.add_dependency(%q<sqlite3-ruby>, [">= 0"])
    s.add_dependency(%q<hoe>, [">= 2.3.3"])
  end
end
