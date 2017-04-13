# -*- encoding: utf-8 -*-
# stub: dicebag 3.2.2 ruby lib

Gem::Specification.new do |s|
  s.name = "dicebag"
  s.version = "3.2.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["SynTruth"]
  s.date = "2016-04-25"
  s.description = "A very flexible dice rolling library for Ruby."
  s.email = "syntruth@gmail.com"
  s.homepage = "https://github.com/syntruth/Dice-Bag"
  s.licenses = ["MIT"]
  s.rubygems_version = "2.5.1"
  s.summary = "Dice Bag: Ruby Dice Rolling Library"

  s.installed_by_version = "2.5.1" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<parslet>, [">= 1.4.0", "~> 1.4"])
    else
      s.add_dependency(%q<parslet>, [">= 1.4.0", "~> 1.4"])
    end
  else
    s.add_dependency(%q<parslet>, [">= 1.4.0", "~> 1.4"])
  end
end
