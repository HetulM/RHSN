# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

# This function maeks the window for the messages scroll to the bottom and focus on the message input. 
$ ->
  $messages = $('#messages')
  $messages.scrollTop $messages.prop('scrollHeight')
  $('#message_input').focus()

# This function makes the message input box clear after a message has been sent (pressing the enter key). 
$(document).on 'keypress', '#message_input', (e) ->
  if e.keyCode == 13 and e.target.value
    App.room.talk(e.target.value)
    e.target.value = ''
    e.preventDefault()
