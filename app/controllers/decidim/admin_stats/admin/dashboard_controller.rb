module Decidim
  module AdminStats
    module Admin
      class DashboardController < ApplicationController
        def index
          @stats ||= Decidim::AdminStats::AdminStatsPresenter.new(organization: current_organization)
        end

        def show
          @metrics ||= Decidim::AdminStats::AdminMetricChartsPresenter.new(participatory_process: participatory_process)
        end

        private

        def participatory_process
          @participatory_process ||= Decidim::ParticipatoryProcess.find_by(slug: params[:id])
        end
      end
    end
  end
end
