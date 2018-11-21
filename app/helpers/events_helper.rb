module EventsHelper
  def display_time(event)
    start = event.starts_at.strftime('%d %b %H:%M')
    return start if event.ends_at.nil?

    "#{start} - #{event.ends_at.strftime('%d %b %H:%M')}"
  end
end
