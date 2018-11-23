class ConversationsController < ApplicationController
  def index
    current_user.events
    current_users.conversations
  end

  def show
    @conversation = Conversation.find(params[:id])
    @message = Message.new
    # @message.messageable = @conversation
  end

  def create
    conversation = Conversation.new
    conversation.sender = current_user
    conversation.recipient = User.find(params[:recepient_id])
    if conversation.save(conversation)
      redirect_to conversation_path(conversation)
    else
      flash[:warning] = 'Oops! something when wrong, please try again'
    end
  end
end
