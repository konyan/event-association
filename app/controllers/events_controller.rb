class EventsController < ApplicationController
  before_action :check_login, only: %i[new create]

  def index
    @events = Event.all
    @upcoming = Event.upcoming_event
    @previous = Event.previous_event
  end

  def new
    @event = Event.new
  end

  def create
    @event = current_user.events.build(event_params)
    if @event.save
      flash[:success] = 'Event has been created'
      redirect_to @event
    else
      render 'new'
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  def create_attend
    @event = Event.find(event_id)
    @attend = Attending.new(attendee_id: current_user.id, attended_event_id: event_id)
    if @attend.save
      flash[:success] = 'Event added'
      redirect_to @event
    else
      render 'show'
    end
  end

  private

  def event_id
    params.require(:event_id).to_i
  end

  def event_params
    params.require(:event).permit(:title, :date, :place, :description)
  end
end
