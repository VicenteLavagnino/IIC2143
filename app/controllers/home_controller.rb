class HomeController < ApplicationController
  def index
    @latest_legos = Product.order(created_at: :desc).limit(5)
  end

  def explora
    @products = Product.all
    
    if params[:search].present?
      @products = @products.where("name LIKE ? OR description LIKE ?", "%#{params[:search]}%", "%#{params[:search]}%")
    end

    if params[:sort].present?
      @products = @products.order(params[:sort])
    end
  end

  def nosotros
  end
  
  def trabaja
  end

  def reporta
  end
  def chat
    user1 = current_user.id
    user2 = params[:user_id]
    @chat = Chat.find_by(user1_id: [user1, user2], user2_id: [user1, user2])
    if @chat
      recipient_id = @chat.user1_id == current_user.id ? @chat.user2_id : @chat.user1_id
      @recipient = User.find(recipient_id)
    else
      if user2
        @chat = Chat.create(user1_id: user1, user2_id: user2)
      end
    end
    @messages = @chat ? @chat.messages.order(created_at: :asc) : []
    @chats = Chat.all
    @users = User.all
    render 'home/chat'
  end
  def create_message
  end  

end
