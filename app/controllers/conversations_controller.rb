class ConversationsController < ApplicationController
  def index
    @conversations = current_user.sender_conversations + current_user.recipient_conversations
    # .each { |c| @conversation << c }
  end

  def show
    @conversation = Conversation.find(params[:id])
    @message = Message.new
    # @message.messageable = @conversation
  end

  def create
    recipient = User.find(params[:recipient_id])
    # check if users already have a conversation
    conversation = current_user.conversation(recipient)
    if conversation.nil?
      conversation = Conversation.new
      conversation.sender = current_user
      conversation.recipient = recipient
      flash[:alert] = 'Oops! something went wrong, please try again' unless conversation.save(conversation)
    end
    redirect_to conversation_path(conversation)
  end
end
