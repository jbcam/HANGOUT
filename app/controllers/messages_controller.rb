include UsersHelper

class MessagesController < ApplicationController
  def create
    message = Message.new(message_params)
    message.messageable = Conversation.find(params[:conversation_id])
    message.user = current_user

    if message.save
      respond_to do |format|
        format.html { redirect_to conversation_path(message.conversation) }
        format.js # <-- will render `app/views/reviews/create.js.erb`
      end
      ActionCable.server.broadcast 'messages',
      currentUser: full_name(current_user),
      content: message.content,
      avatar: message.user.avatar.url(:avatar, secure: true)
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
