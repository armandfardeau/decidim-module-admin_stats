# frozen_string_literal: true

require "rails"
require "decidim/core"

module Decidim
  module AdminStats
    # This is the engine that runs on the public interface of admin_stats.
    class Engine < ::Rails::Engine
      isolate_namespace Decidim::AdminStats

      routes do
        # Add engine routes here
        # resources :admin_stats
        # root to: "admin_stats#index"
      end

      initializer "decidim_admin_stats.assets" do |app|
        app.config.assets.precompile += %w[decidim_admin_stats_manifest.js decidim_admin_stats_manifest.css]
      end
    end
  end
end
