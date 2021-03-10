class EventsController < ApplicationController
  before_action :set_event, only: [:edit, :update, :destroy, :decline, :approve]

  def index
    @berlin_office = User.joins(:daily_statuses).where(daily_statuses: {title: "Berlin Office 🐻", date: Date.today})
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
      redirect_to events_path, notice: "You invited #{@event.invitee.full_name}."
    else
      render :index, notice: "Ups, there were an error. Please, try again."
    end
  end

  def approve
    @event.status = "approved"
    @event.save
    redirect_to events_path, notice: "You joined the event with #{@event.user.full_name}."
  end

  def decline
    @event.status = "declined"
    @event.save
    redirect_to events_path, notice: "You declined the event with #{@event.user.full_name}."
  end

  def edit

  end

  def update
    if @event.update(event_params)
      redirect_to events_path, notice: "Event was successfully updated."
    else
      render :index, notice: "Ups, there were an error. Please, try again."
    end
  end

  def destroy
    @event.destroy
    redirect_to events_path, notice: "Event was successfully deleted."
  end


  private

  def set_event
    @event = Event.find(params[:id])
     authorize @event
  end

  def event_params
    params.require(:event).permit(:user_id, :title, :content, :status, :invitee_id, :start_time, :end_time)
  end
end
