class PagesController < ApplicationController
  def home
    @daily_statuses = current_user.daily_statuses
    if params[:date]
      @date = Date.parse(params[:date])
    else
      @date = Date.today
    end
    @new_daily_status = DailyStatus.new
    @daily_status = current_user.daily_statuses.find_by(date: params[:date])
  end
end

