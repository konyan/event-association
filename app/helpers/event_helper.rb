module EventHelper
  def create_user_check(event)
    event.creater_id != current_user.id
  end

  def attend_user_check(event)
    current_user.attended_events.each do |e|
      return e === event
    end
  end
end
