# frozen_string_literal: true

module Decidim
  module AdminStats
    module Admin
      class Permissions < Decidim::DefaultPermissions
        def permissions
          return disallow! unless user

          if user.admin?
            allow! if permission_action.scope == :admin && permission_action.subject == :dashboard
          end

          permission_action
        end
      end
    end
  end
end
