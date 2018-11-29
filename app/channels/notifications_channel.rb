# app/channels/notifications_channel.rb

class NotificationsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "user_#{params[:user_id]}"
  end
end
