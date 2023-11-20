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
    @show_offer_button = @offers.any? { |offer| offer.status == 'En espera' }
  end
  
  
  def create
    @offer = @product.offers.build(offer_params)
    @offer.user = current_user # Asegúrate de que current_user esté definido
  
    if @offer.save
      # Utiliza el helper de ruta correcto que definiste para mostrar un producto
      redirect_to explora_product_path(id: @product.id)
    else
      render :new
    end
  end
  def accept
    @offer = Offer.find(params[:id])
    # Lógica para aceptar la oferta
    # Por ejemplo, cambiar el estado de la oferta y posiblemente del producto
    
    if @offer.update(state: 'aceptada')
      redirect_to product_path(@offer.product), notice: 'Has aceptado la oferta y ahora procederás al intercambio.'
    else
      redirect_to product_path(@offer.product), alert: 'No se pudo aceptar la oferta.'
    end
  end
  def destroy
    @offer.destroy
    respond_to do |format|
      format.html { redirect_back(fallback_location: root_path) }
      format.json { head :no_content }
    end
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
    params.require(:offer).permit(:name, :description, :image, :state)
  end
end
