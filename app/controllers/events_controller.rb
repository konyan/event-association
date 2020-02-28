class EventsController < ApplicationController
before_action :check_login, only: %i[new create]
      
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

    private
    def event_params
        params.require(:event).permit(:title,:date)
    end
end
