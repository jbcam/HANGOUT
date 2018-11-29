class Chats::MessagesController < ApplicationController
  include ActionView::Helpers::UrlHelper

  def create
    message = Message.new(message_params)
    message.messageable = params[:conversation_id].present? ? Conversation.find(params[:conversation_id]) : Event.find(params[:event_id])
    message.user = current_user

    if message.save
      broadcast_message(message)
      broadcast_notification(message)
      respond_to do |format|
        format.html { redirect_to conversation_path(message.conversation) }
        format.js
      end
    else
      flash[:alert] = 'Oops! something when wrong, please try again'
    end
  end

  private

  def broadcast_message(message)
    ActionCable.server.broadcast "chat_#{message.messageable.id}",
      sender_message_partial: ApplicationController.renderer.render(
        partial: 'chats/messages/message',
        locals: {
          current_user: current_user,
          message: message
        }
      ),
      recipient_message_partial: ApplicationController.renderer.render(
        partial: 'chats/messages/message',
        locals: {
          current_user: message.messageable.partner(current_user),
          message: message
        }
      ),
      sender_id: current_user.id

    head :ok
  end

  def broadcast_notification(message)
    message.messageable.partners(current_user).each do |user|
    ActionCable.server.broadcast "user_#{user.id}",
      unread_conversations: user.unread_conversations
    head :ok
    end
  end

  def message_params
    params.require(:message).permit(:content, :messageable_id, :messageable_type)
  end
end
