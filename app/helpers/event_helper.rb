module EventHelper
  def create_user_check(event)
    event.creater_id == current_user.id
  end

  def attend_user_check(event)
    !current_user.attended_events
      .select { |e| e.id == event.id }.empty?
  end

  def attend_user(event_id)
    @attend = Attending.new(attendee_id: current_user.id, attended_event_id: event_id)
    if @attend.save
      flash[:success] = 'Added to your attending events'
    else
      flash[:danger] = 'Not added to list'
      render 'show'
    end
  end
end
