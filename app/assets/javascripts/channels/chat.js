
$(document).on('turbolinks:load', function(){

  var messages = $('#messages')
  
  if (messages.length > 0){
    var room_id = messages.data('room-id')
    App.chat = App.cable.subscriptions.create( { channel: "ChatChannel", room_id: room_id }, {
      connected: function(){
        console.log('connected')
      },
        // Called when the subscription is ready for use on the server
    
      disconnected: function(){
    
      },
        // Called when the subscription has been terminated by the server
    
      received: function(data){
        $('.messages').append(`<p>${data.message}</p>`);
      },
        // Called when there's incoming data on the websocket for this channel
    
      post: function(message){
        return this.perform('post', { message: message, room_id: room_id });
      }
    });

    $('.chat_button').on('click', function(event){
      var textarea1 = $('#textarea1')
      text = textarea1.val()
      textarea1.val("")
      App.chat.post(text)
    })
  }
})
