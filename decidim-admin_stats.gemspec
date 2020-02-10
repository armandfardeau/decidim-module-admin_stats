# frozen_string_literal: true

$LOAD_PATH.push File.expand_path("lib", __dir__)

require "decidim/admin_stats/version"

Gem::Specification.new do |s|
  s.version = Decidim::AdminStats.version
  s.authors = ["Armand"]
  s.email = ["fardeauarmand@gmail.com"]
  s.license = "AGPL-3.0"
  s.homepage = "https://github.com/decidim/decidim-module-admin_stats"
  s.required_ruby_version = ">= 2.5"

  s.name = "decidim-admin_stats"
  s.summary = "A decidim admin_stats module"
  s.description = "Display stats on admin side."

  s.files = Dir["{app,config,lib}/**/*", "LICENSE-AGPLv3.txt", "Rakefile", "README.md"]

  s.add_dependency "decidim-core", Decidim::AdminStats.version
end
