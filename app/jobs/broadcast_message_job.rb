class BroadcastMessageJob < ApplicationJob
  queue_as :default

  # Using Action View to render the message. The message is broadcasted from the room channel and then 
  # rendered. 
  def perform(message)
    ActionCable.server.broadcast 'room_channel', render_message(message)
  end

  private
  # We use rendered.render so that we can grab the message partial from the view. 
  def render_message(message)
    ApplicationController.renderer.render message
  end
end
