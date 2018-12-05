class BroadcastMessageJob < ApplicationJob
  queue_as :default

  def perform(message)
    ActionCable.server.broadcast "chat_#{message.messageable.id}",
     sender_message_partial: ApplicationController.renderer.render(
      partial: 'chats/messages/message',
      locals: {
        current_user: message.user,
        message: message
      }
    ),
    sender_id: message.user.id,
    system_message: true
  end
end
