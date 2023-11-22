# app/controllers/users_controller.rb
class UserController < ApplicationController
    before_action :authenticate_user!
    before_action :admin_only, only: :ban
  
    def ban
      @user = User.find(params[:id])
      UserReport.where(user_id: @user.id).delete_all
      @user.destroy # o tu lógica personalizada para banear
  
      redirect_to root_path, notice: 'Usuario baneado o eliminado con éxito.'
    end
  
    private
  
    def admin_only
      unless current_user.admin?
        redirect_to root_path, alert: "No autorizado."
      end
    end
  end
  