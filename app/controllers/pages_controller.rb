class PagesController < ApplicationController
  def home
    @daily_statuses = current_user.daily_statuses
    if params[:date]
      @date = Date.parse(params[:date])
    else
      @date = Date.today
    end
  end
end

