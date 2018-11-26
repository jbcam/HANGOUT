module ConversationsHelper
  def conversation_partner(message)
    message.sender == current_user ? message.recipient : message.sender
  end
end
