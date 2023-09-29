class ChatUserController < ApplicationController
  def show

    @chatuser = ChatUser.all
      render json: @chatuser
  end
  def create
    @chatuser = ChatUser.new(chatuser_params)
      if @chatuser.save
        render json: @chatuser
      else
        render json: @chatuser.errors, status: :unprocessable_entity
      end
  end

  def update
    @chatuser = ChatUser.find(params[:id])
      if @chatuser.update(request_params)
        render json: @chatuser
      else
        render json: @chatuser.errors, status: :unprocessable_entity
      end
  end

  def filter
      @chatuser = ChatUser.where("id = ?", params[:id]) 
      render json: @chatuser 
  end
  
  def destroy
      @chatuser = ChatUser.find(params[:id])
      @chchatuserat.destroy
  end

  def chatuser_params
    params.require(:chatuser).permit(:type, :description, :state, :request)
  end
end
