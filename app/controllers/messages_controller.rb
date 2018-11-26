class MessagesController < ApplicationController

  def create
    message = Message.new(message_params)
    message.messageable = Conversation.find(params[:conversation_id])
    message.user = current_user
    if message.save
      redirect_to conversation_path(message.messageable)
    else
      flash[:alert] = 'Oops! something when wrong, please try again'
      redirect_to conversation_path(message.messageable)
    end
  end

  private

  def message_params
    params.require(:message).permit(:content, :messageable_id, :messageable_type)
  end
end
