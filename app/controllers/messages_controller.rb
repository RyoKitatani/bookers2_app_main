class MessagesController < ApplicationController
  def create
    @message = current_user.messages.new(message_params)
    @room = @message.room
    if @message.save
    # redirect_to room_path(@message.room)
    else
      redirect_back(fallback_location: root_path)
    end
  end
  
  def destroy
    @message = Message.find(params[:id])
    @room = @message.room
    @message.destroy
    # redirect_back(fallback_location: root_path)
  end

  private

    def message_params
      params.require(:message).permit(:room_id, :body)
    end
end