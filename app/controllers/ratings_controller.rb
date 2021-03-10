class RatingsController < ApplicationController
  def create
    rating = Rating.new(value_stars: params[:value_stars])
    p rating
    daily_status = DailyStatus.find(params[:daily_status_id])
    rating.daily_status = daily_status
    authorize rating
    if rating.save
      redirect_to root_path(date: daily_status.date), notice: "Thanks #{current_user.first_name}, see you tomorrow 🎉"
    else
      render :index
    end
  end

  private

  def ratings_params
    params.require(:rating).permit(:value_stars)
  end
end
