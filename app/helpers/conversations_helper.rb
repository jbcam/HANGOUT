module ConversationsHelper
  def display_time(user1, user2)

    return start if event.ends_at.nil?

    "#{start} - #{event.ends_at.strftime('%d %b %H:%M')}"
  end
end
