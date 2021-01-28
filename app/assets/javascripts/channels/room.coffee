# This file contains the actions which are performed for when messages are recieved within the webcoscket 
# for the rooms channel. 
App.room = App.cable.subscriptions.create "RoomChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    # Called when there's incoming data on the websocket for this channel
    $messages = $('#messages')
    $messages.append data
    $messages.scrollTop $messages.prop('scrollHeight')

  talk: (message) ->
    @perform 'talk', message: message
