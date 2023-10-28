class MessagesController < ApplicationController

    def create
      @chat = Chat.find(params[:chat_id])
      @message = @chat.messages.build(message_params)
      @message.user = current_user
  
      if @message.save
          # Redirige de nuevo al chat con el nuevo mensaje visible
          redirect_to chat_path(@chat)
      else
          # Maneja el caso en el que el mensaje no se puede guardar (por ejemplo, si está vacío)
          flash[:alert] = "No se pudo enviar el mensaje."
          redirect_to chat_path(@chat)
      end
    end
  
    private
  
    def message_params
      params.require(:message).permit(:content)
    end
  end
  