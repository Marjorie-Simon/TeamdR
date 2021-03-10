class DailyStatusesController < ApplicationController
  def create
    @daily_status = DailyStatus.new(daily_status_params)
    @daily_status.user = current_user
    authorize @daily_status
    if @daily_status.save
      redirect_to root_path(date: @daily_status.date), notice: "You have created your status for #{@daily_status.date}"
    else
      render :index
    end

  end

  def update
    if params[:daily_status][:date].present?
      @daily_status = current_user.daily_statuses.find_by(date: params[:daily_status][:date])
    else
       @daily_status = current_user.daily_statuses.find_by(date: Date.today)
    end
    @daily_status.update(daily_status_params)
     authorize @daily_status
      if @daily_status.save
          redirect_to root_path(date: @daily_status.date), notice: "You have updated your status for #{@daily_status.date}"
      else
      render :index
    end
  end

  def dailygoal
    @daily_status = current_user.daily_statuses.find_by(date: params[:daily_status][:date])
    @daily_status.daily_goal.update(daily_goal_params)
    authorize @daily_status
  end

  private

  def daily_status_params
    params.require(:daily_status).permit(:title, :date, :daily_goal)
  end


end
