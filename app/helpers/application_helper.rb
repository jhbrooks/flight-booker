module ApplicationHelper
  def formatted_start_date(start_date)
    start_date.strftime("%-m/%-d/%Y")
  end

  def parsable_start_date(start_date)
    start_date.strftime("%m/%d/%Y")
  end

  def formatted_start_time(start_time)
    start_time.strftime("%-m/%-d/%Y %l:%M %p")
  end

  def formatted_duration(duration)
    duration.strftime("%k:%M")
  end
end
