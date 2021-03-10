class DashboardsController < ApplicationController

  def dashboard
    skip_authorization
    # @dashboards = policy_scope(Dashboard)

    @berlin_office = DailyStatus.group_by_day(:date).where(title: 'Berlin Office 🐻').count
    @home_office = DailyStatus.group_by_day(:date).where(title: 'At home 💻').count
    @köln_office = DailyStatus.group_by_day(:date).where(title: 'Köln Office ⛪️').count
    @business_trip = DailyStatus.group_by_day(:date).where(title: 'Business trip ✈️').count
    @vacation = DailyStatus.group_by_day(:date).where(title: 'Off 🏝').count
    @sick_leave = DailyStatus.group_by_day(:date).where(title: 'Sick 🤒').count

    @employee_happiness = Rating.group(:value_stars).count

    @startdate = Date.today
    @enddate = Date.today + 7
    
    if params[:startdate].present?
      @startdate = params[:startdate]
    end
    if params[:enddate].present?
      @enddate = params[:enddate]
    end
    @berlin_office = DailyStatus.group_by_day(:date).where(title: 'Berlin Office 🐻').count
  end

end
