class Chats::MessagesController < ApplicationController
  include ActionView::Helpers::UrlHelper

  def create
    message = Message.new(message_params)
    message.messageable = params[:conversation_id].present? ? Conversation.find(params[:conversation_id]) : Event.find(params[:event_id])
    message.user = current_user

    if message.save
      respond_to do |format|
        format.html { redirect_to conversation_path(message.conversation) }
        format.js
      end

      ActionCable.server.broadcast 'messages',
        conversation_id: message.messageable.id,
        message_partial: ApplicationController.renderer.render(
          partial: 'chats/messages/message',
          locals: {
            current_user: current_user,
            message: message
          }
        )
      head :ok
    else
      flash[:alert] = 'Oops! something when wrong, please try again'
    end
  end

  private




  def message_params
    params.require(:message).permit(:content, :messageable_id, :messageable_type)
  end
end
