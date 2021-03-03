class UsersController < ApplicationController
  def index
    @users = policy_scope(User)
  end

  def new
    @user = User.new
    authrize @user
  end
end
