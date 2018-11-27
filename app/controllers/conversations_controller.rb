class ConversationsController < ApplicationController
  before_action :set_conversation, only: [:show, :update]

  def index
    @conversations = current_user.sender_conversations + current_user.recipient_conversations
  end

  def show
    @message = Message.new
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

  def update
    @conversation.messages.reverse_each do |message|
      return if message.read

      message.read = true unless message.user.id == current_user.id
      message.save!
    end
    respond_to do |format|
      format.html { redirect_to conversation_path(@conversation) }
      format.js
    end
  end

  private

  def set_conversation
    @conversation = Conversation.find(params[:id])
  end
end
