class ChatsController < ApplicationController
  def index
    current_user.events

    current_users.conversations
  end

  def show
    @message = Message.new
    @messages  = [Message.new(content: "blablalblalblal")]
  end
end
