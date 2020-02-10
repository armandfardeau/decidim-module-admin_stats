# frozen_string_literal: true

module Decidim
  module AdminStats
    module Admin
      # This controller is the abstract class from which all other controllers of
      # this engine inherit.
      #
      # Note that it inherits from `Decidim::Admin::Components::BaseController`, which
      # override its layout and provide all kinds of useful methods.
      class ApplicationController < Decidim::Admin::ApplicationController
        layout "decidim/admin_stats/admin/stats"

        helper_method :participatory_spaces

        register_permissions(::Decidim::AdminStats::Admin::ApplicationController,
                             ::Decidim::AdminStats::Admin::Permissions)

        def permission_class_chain
          ::Decidim.permissions_registry.chain_for(::Decidim::AdminStats::Admin::ApplicationController)
        end

        def participatory_spaces
          @participatory_spaces ||= ParticipatoryProcesses::OrganizationParticipatoryProcesses.new(current_organization).query
        end
      end
    end
  end
end
