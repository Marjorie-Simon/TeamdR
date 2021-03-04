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

  def update

  end

  def destroy

  end

  private

  def event_params
    params.require(:event).permit(:title, :content, :status, :invitee_id, :start_time, :end_time)
  end
end
