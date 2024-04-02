# app/controllers/offers_controller.rb
class OffersController < ApplicationController
  before_action :set_product, only: [:new, :create]
  before_action :set_offer, only: [:destroy]
  before_action :check_user, only: [:destroy]
  def new
    @offer = @product.offers.build
  end

  def show
    @product = Product.find(params[:id])
    @offers = @product.offers.includes(:user) # Asegúrate de incluir :user para evitar N+1 queries
  end
  
  
  def create
    @offer = @product.offers.build(offer_params)
    uploaded_image = Cloudinary::Uploader.upload(params[:offer][:image])
    @offer.image = uploaded_image['url']

    @offer.user = current_user # Asegúrate de que current_user esté definido
    @offer.state = "Propuesta"
    if @offer.save
      redirect_to explora_product_path(id: @product.id)
    else
      render :new
    end
  end
  def destroy
    @offer = Offer.find(params[:id])
    @offer.destroy
    redirect_to explora_product_path(id: @offer.product.id) # o cualquier otra página después de eliminar
  end
  
  private

  def set_offer
    @offer = Offer.find(params[:id])
  end

  def check_user
    redirect_to(root_url, alert: "No autorizado") if @offer.user != current_user
  end

  private

  def set_product
    @product = Product.find(params[:product_id])
  end

  def offer_params
    params.require(:offer).permit(:name, :description, :image, :set)
  end
end
