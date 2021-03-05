class UsersController < ApplicationController
  def index
    @users = policy_scope(User)
    @home_office = User.joins(:daily_statuses).where(daily_statuses: {title: "At home", date: Date.today } )
    @berlin_office = User.joins(:daily_statuses).where(daily_statuses: {title: "Berlin Office", date: Date.today})
    @kölln_office = User.joins(:daily_statuses).where(daily_statuses: {title: "Köln Office", date: Date.today})
  end

  def new
    @user = User.new
    authorize @user
  end
end
