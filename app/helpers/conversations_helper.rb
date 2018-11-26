module ConversationsHelper
  def conversation_partner(conversation)
    conversation.sender == current_user ? conversation.recipient : conversation.sender
  end

  def count_unread_messages(conversation)
    count = conversation.messages.count { |message| !message.read }
    count.nil? ? 0 : count
  end

  def count_all_unread_messages(user)
    count = 0
    user.sender_conversations.each { |conversation| count += count_unread_messages(conversation) }
    user.recipient_conversations.each { |conversation| count += count_unread_messages(conversation) }
    count
  end
end
