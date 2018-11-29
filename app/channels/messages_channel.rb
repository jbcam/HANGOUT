# app/channels/messages_channel.rb

class MessagesChannel < ApplicationCable::Channel
  def subscribed
    stream_from "chat_#{params[:channel_id]}"
  end
end
