class ChatChannel < ApplicationCable::Channel
  def subscribed
    room = Room.find(params[:room_id])
    stream_for room
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def post(data)
    #Message.create!(content: data['message'] )
    room = Room.find(data['room_id'])
    room.messages.create!(content: data['message'])
    ChatChannel.broadcast_to(room, { message: data['message'] })
    #ActionCable.server.broadcast('chat_room', message: data['message'])
  end
end
