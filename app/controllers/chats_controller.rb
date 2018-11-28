class ChatsController < ApplicationController
  def index
    @channels = current_user.events + current_user.recipient_conversations + current_user.sender_conversations

    @channels.sort_by { |channel| channel.messages.last ? channel.messages.last.created_at : 0 }
  end
end
