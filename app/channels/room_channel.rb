class RoomChannel < ApplicationCable::Channel
  def subscribed
    stream_from "room_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  # The action which is called when a new message is created. 
  def talk(data)
    Message.create content: data['message'], user: current_user
  end
end
