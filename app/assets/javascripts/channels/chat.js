App.chat = App.cable.subscriptions.create("ChatChannel", {
  connected: function(){
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
    return this.perform('post', { message: message });
  }
});

$(document).on('turbolinks:load', function(){
  $('.chat_button').on('click', function(event){
    var textarea1 = $('#textarea1')
    text = textarea1.val()
    textarea1.val("")
    App.chat.post(text)
  })
})
