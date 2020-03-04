class AttendingsController < ApplicationController
  def new; end

  def create
    @attend = Attending.new(attendee_id: current_user.id, attended_event_id: params[:event_id].to_i)
    if @attend.save
      flash[:success] = 'Event added'
      redirect_to events_path
    else
      render 'show'
    end
  end

  private
end
