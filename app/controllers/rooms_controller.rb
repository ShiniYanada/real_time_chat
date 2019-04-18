class RoomsController < ApplicationController
  def index
    @search = Room.ransack(params[:q])
    @rooms = @search.result
    @room = Room.new
  end

  def show
    @room = Room.find(params[:id])
    @messages = @room.messages
  end

  def create
    @room = Room.new(room_params)
    if @room.save 
      redirect_to room_path(@room)
    else 
      render 'index'
    end
  end 

  private 

    def room_params
      params.require(:room).permit(:name)
    end 
end
