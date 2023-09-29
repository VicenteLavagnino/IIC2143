class ChatController < ApplicationController

  def show
    @chats = Chat.all
      render json: @chats
  end
  def create
    @chat = Chat.new(chat_params)
      if @chat.save
        render json: @chat
      else
        render json: @chat.errors, status: :unprocessable_entity
      end
  end

  def update
    @chat = Chat.find(params[:id])
      if @chat.update(request_params)
        render json: @chat
      else
        render json: @chat.errors, status: :unprocessable_entity
      end
  end

  def filter
    @chat = Chat.where("id = ?", params[:id]) 
      render json: @chat 
  end
    
  def destroy
    @chat = Chat.find(params[:id])
      @chat.destroy
  end

  def chat_params
    params.require(:chat).permit(:type, :description, :state, :request)
  end
end
