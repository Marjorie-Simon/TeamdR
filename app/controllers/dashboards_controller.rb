class DashboardsController < ApplicationController

  def dashboard
    @dashboards = policy_scope(Dashboard)
  end
  
end
