# frozen_string_literal: true

module Decidim
  module AdminStats
    # This is the engine that runs on the public interface of `AdminStats`.
    class AdminEngine < ::Rails::Engine
      isolate_namespace Decidim::AdminStats::Admin

      paths["db/migrate"] = nil
      paths["lib/tasks"] = nil

      routes do
        resources :dashboard, only: [:index, :show]
        root to: "dashboard#index"
      end

      initializer "decidim_admin_stats.admin_mount_routes" do
        Decidim::Core::Engine.routes do
          mount Decidim::AdminStats::AdminEngine, at: "/admin/stats", as: "decidim_admin_stats"
        end
      end

      initializer "decidim_admin_stats.admin_assets" do |app|
        app.config.assets.precompile += %w(decidim_admin_stats.css)
      end

      initializer "decidim_admin_stats.admin_menu" do
        Decidim.menu :admin_menu do |menu|
          menu.item I18n.t("menu.admin_stats", scope: "decidim.admin_stats"),
                    decidim_admin_stats.dashboard_index_path,
                    icon_name: "text",
                    position: 7.1,
                    active: ["decidim/admin/stats/dashboard" => :index]#,
            #if: allowed_to?(:read, organization: current_organization)
        end
      end

      def load_seed
        nil
      end
    end
  end
end
