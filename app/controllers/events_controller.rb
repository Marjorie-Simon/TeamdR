class EventsController < ApplicationController
  def index
    @events = policy_scope(Event)
  end

  def new
    @event = Event.new
    authorize @restaurant
  end

  def create
    @event = Event.new(event_params)

  end


  private

  def event_params
    params.require(:event).permit(:title, :content, :status, :user_id, :invitee_id, :start_time, :end_time)
  end
end
