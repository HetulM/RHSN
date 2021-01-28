class RoomsController < ApplicationController

  # The controller for the message room, this contains the action to show the messages. 

  before_action :authenticate_user!
  
  def show
    @messages = Message.last(40) # Only shows the last 40 messages which have been sent to ensure the load 
    # times are not slowed down. 
  end
end
