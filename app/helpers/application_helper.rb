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
      datetime.strftime("%m/%d")
    end
  end
end
