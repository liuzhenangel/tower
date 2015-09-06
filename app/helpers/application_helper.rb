module ApplicationHelper
  def format_date(datetime)
    datetime.strftime("%H:%M")
  end
end
