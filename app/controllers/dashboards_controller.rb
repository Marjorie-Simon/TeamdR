class DashboardsController < ApplicationController

  def dashboard
    skip_authorization
    # @dashboards = policy_scope(Dashboard)
  end
  
end
