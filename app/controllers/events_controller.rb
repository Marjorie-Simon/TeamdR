class EventsController < ApplicationController
  def index
    @events = policy_scope(Event)
    @event = Event.new(start_time: Time.now, end_time: Time.now + 1)
    authorize @event
  end

  def new
    @event = Event.new
    authorize @event
  end

  def create
    @event = Event.new(event_params)
    @event.user = current_user
    authorize @event
    if @event.save
      redirect_to events_path, notice: "You invited #{@event.invitee.full_name}"
    else
      render :index
    end
  end

  def approve
    @event = Event.find(params[:id])
    authorize @event
    @event.update(event_params)
    redirect_to @events, notice: "You joined the event with #{@events.user.full_name}"
  end

  def decline
    @event = Event.find(params[:id])
    @event.update(event_params)
    authorize @event
  end


  private

  def event_params
    params.require(:event).permit(:user_id, :title, :content, :status, :invitee_id, :start_time, :end_time)
  end
end
