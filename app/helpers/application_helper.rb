module ApplicationHelper
  def format_date(datetime)
    datetime.strftime("%H:%M")
  end

  def active_for(navbar_name)
    navbar_name ? "actived" : ""
  end

  def is_delay(end_time)
    ( end_time && Time.now - end_time > 0 ) ? 'delay' : ''
  end

  def format_short_date(date)
    if date.to_date == Time.now.to_date
      '今'
    else
      date.strftime("%m/%d")
    end
  end

  def generate_project(event)
    cookies['project_guid'] = event.resource_object_type + event.resource_object_id.to_s + event.created_at.to_date.to_s
  end

  def generate_date(event)
    cookies['date_guid'] = event.created_at.to_date
  end

  def generate_project_exist?(event)
    cookies['project_guid'] == (event.resource_object_type + event.resource_object_id.to_s + event.created_at.to_date.to_s)
  end

  def generate_date_exist?(event)
    cookies['date_guid'] == event.created_at.to_date.to_s
  end

  def has_class_weekend?(event, team)
    event == Event.where(team_id: team.id).first ? 'weekend' : ''
  end

  def select_by_project(events)
    project_events, p_events = [], []
    sub_event = events.first
    events.each do |event|
      if sub_event.find_project == event.find_project
        p_events << event
      else
        project_events << p_events if p_events.present?
        sub_event = event
        p_events = []
        p_events << event
      end
    end
    project_events << p_events if p_events.present?
    project_events
  end

  def select_by_date(events)
    date_events = []
    size = date_size(events)
    size.times do |t|
      before_of_day = events.first.created_at.to_date
      end_of_day = events.first.created_at.to_date.end_of_day
      sub_events =  events.map{|e| e if (before_of_day < e.created_at) && (e.created_at < end_of_day) }.compact
      date_events << sub_events
      events = events - sub_events
    end
    date_events
  end

  def date_size(events)
    events.map{|a| a.created_at.to_date }.uniq.size
  end
end
