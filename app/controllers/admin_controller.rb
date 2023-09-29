class AdminController < ApplicationController
  def show
    @admins = Admin.all
      render json: @admins
  end
  def create
    @admin = Admin.new(admin_params)
      if @admin.save
        render json: @admin
      else
        render json: @admin.errors, status: :unprocessable_entity
      end
  end

  def update
    @admin = Admin.find(params[:id])
      if @admin.update(admin_params)
        render json: @admin
      else
        render json: @admin.errors, status: :unprocessable_entity
      end
  end

  def filter
    @admins = Admin.where("id = ?", params[:id])
      render json: @admins 
  end

  def destroy
    @admin = Admin.find(params[:id])
      @admin.destroy
  end



  def admin_params
    params.require(:admin).permit(:name, :description, :image, :number, :mail, :password)
  end
end
