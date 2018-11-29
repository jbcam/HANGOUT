class AttendeesController < ApplicationController
  def create
    @event = Event.find(params[:event_id])
    if current_user.events.include? @event
      destroy(@event)
    else
      attendee = Attendee.new
      attendee.event = @event
      attendee.user = current_user
      if attendee.save
        send_join_message(@event)
        respond_to do |format|
          format.html { redirect_to event_path(@event) }
          format.js
        end
      end
    end
  end

  private

  def send_join_message(event)
    message = Message.new
    message.user = current_user
    message.messageable = event
    message.content = "#{current_user.first_name} has join the event"
    message.system_message = true
    message.save
    broadcast_message(message)
  end

  def destroy(event)
    event.attendees.where(user: current_user).first.destroy
    send_left_message(event)
  end

  def send_left_message(event)
    message = Message.new
    message.user = current_user
    message.messageable = event
    message.content = "#{current_user.first_name} has left the event"
    message.system_message = true
    message.save
    broadcast_message(message)
  end

  def broadcast_message(message)
    ActionCable.server.broadcast "chat_#{message.messageable.id}",
      sender_message_partial: ApplicationController.renderer.render(
          partial: 'chats/messages/message',
          locals: {
            current_user: current_user,
            message: message
          }
        ),
        sender_id: message.user.id,
        system_message: true
      head :ok
  end
end
