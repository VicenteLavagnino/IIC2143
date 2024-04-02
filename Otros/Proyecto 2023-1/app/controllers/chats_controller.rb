# frozen_string_literal: true

class ChatsController < ApplicationController
  def show
    @chat = Chat.find(params[:id])
  end

  def new
    @chat = Chat.new
  end

  def edit
    @chat = Chat.find(params[:id])
  end

  def create
    @chat = Chat.new(chat_params)
    if @chat.save
      redirect_to @chat
    else
      render 'new'
    end
  end

  def update
    @chat = Chat.find(params[:id])
    if @chat.update(chat_params)
      redirect_to @chat
    else
      render 'edit'
    end
  end

  def destroy
    @chat = Chat.find(params[:id])
    @chat.destroy
    redirect_to chats_path
  end

  private

  def chat_params
    params.require(:chat).permit(:name, :email, :password)
  end
end
