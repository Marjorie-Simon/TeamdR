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
    @daily_status = current_user.daily_statuses.find_by(date: params[:daily_status][:date])
    @daily_status.update(daily_status_params)
     authorize @daily_status
      if @daily_status.save
          redirect_to root_path(date: @daily_status.date), notice: "You have updated your status for #{@daily_status.date}"
      else
      render :index
    end
  end



  private

  def daily_status_params
    params.require(:daily_status).permit(:title, :date)
  end


end
