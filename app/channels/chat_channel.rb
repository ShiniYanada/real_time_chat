class ChatChannel < ApplicationCable::Channel
  def subscribed
    stream_from "chat_room"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def post(data)
    Message.create!(content: data['message'] )
    ActionCable.server.broadcast('chat_room', message: data['message'])
  end
end
