class RatingsController < ApplicationController
  def create
    rating = Rating.new(value_stars: params[:value_stars])
    daily_status = DailyStatus.find(params[:daily_status_id])
    rating.daily_status = daily_status
    authorize rating
    p rating
    if rating.save
      redirect_to root_path(date: daily_status.date), notice: "Thanks #{current_user.first_name}, have a nice evening 🎉"
    else
      render :index
    end
  end

  private

  def ratings_params
    params.require(:rating).permit(:value_stars)
  end
end
