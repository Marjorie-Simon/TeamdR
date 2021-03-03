class PagesController < ApplicationController
  def home
  end
  def index
  @events = Event.all
end



end

