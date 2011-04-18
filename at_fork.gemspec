# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "at_fork"
  s.version = "0.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Vasily Fedoseyev"]
  s.email = ["vasilyfedoseyev@gmail.com"]

  s.date = %q{2011-04-15}
  s.description = %q{Allows to track process forks in ruby. Normally you do not need it, as all handles etc. are copied, but if you have low-level handles to external resources - this may help.}
  s.homepage = %q{http://github.com/Vasfed/ruby_at_fork}
  s.rdoc_options = ["--main", "README.rdoc"]
  s.require_paths = ["lib", "ext/at_fork"]
  s.rubyforge_project = %q{at_fork}
  s.rubygems_version = %q{1.7.2}
  s.summary = %q{Allows to track process forks in ruby}

  s.files = Dir.glob("[A-Z]*") + Dir.glob("*.{c,h,rb}") + Dir.glob("{examples,lib}/**/*")
  s.extensions = ["ext/at_fork/extconf.rb"]
  s.extra_rdoc_files = ["History.txt", "Manifest.txt"]
  s.test_files = Dir.glob('test/**')
end
