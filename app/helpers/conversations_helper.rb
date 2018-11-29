module ConversationsHelper
  def conversation_partner(conversation)
    conversation.sender == current_user ? conversation.recipient : conversation.sender
  end
end
