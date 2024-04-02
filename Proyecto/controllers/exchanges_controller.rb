class ExchangesController < ApplicationController
  def lobby_exchange
    @exchanges = Exchange.all
      @exchanges_done_finalized = ExchangeDone.where(state: 'Completada').where("seller_id = ? OR bidder_id = ?", 
                                                                                current_user.id, current_user.id)
      @exchanges_done_failed = ExchangeDone.where(state: 'Fallida').where("seller_id = ? OR bidder_id = ?", 
                                                                          current_user.id, current_user.id)
  end
  def confirmation
    @user = User.find(params[:id])
    @offer = Offer.find_by(user_id: @user.id)
    if !@offer.nil?
      @offer.update(state: 'En espera')
    
  
    # Verificar si ya existe un Exchange para esta oferta
    unless Exchange.exists?(offer: @offer)
      Exchange.create!(
        product: @offer.product,
        offer: @offer,
        seller_state: 'Pendiente',
        bidder_state: 'Pendiente'
      )
    end
    end
  end
  def confirmar_intercambio
    @exchange = Exchange.find(params[:id])
      if current_user == @exchange.offer.user
        @exchange.update(bidder_state: 'Confirmado')
      elsif current_user == @exchange.product.user
        @exchange.update(seller_state: 'Confirmado')
      end
  
  
      if @exchange.bidder_state == 'Confirmado' && @exchange.seller_state == 'Confirmado'
        @bidder = @exchange.offer.user
          @new_product_bidder = Product.create!(
              name: @exchange.product.name,
              description: @exchange.product.description,
              image: @exchange.product.image,
              user: @exchange.offer.user,
              set: @exchange.product.set
            )
              
          @seller = @exchange.product.user
          @new_product_seller = Product.create!(
              name: @exchange.offer.name,
              description: @exchange.offer.description,
              image: @exchange.offer.image,
              user: @exchange.product.user,
              set: @exchange.offer.set
            )
          
          
          @bidder.products << @new_product_bidder
          @seller.products << @new_product_seller
          @exchange.product.destroy
          @exchange.offer.destroy
          @exchange.destroy #Al destruirse la exchange se crea automaticamente la exchange done
          redirect_to my_legos_path   

      else
        #Redirigir a alguna otra página o mostrar un mensaje de éxito
        redirect_to exchange_lobby_path
        #redirect_to alguna_otra_pagina_path
      end
      
  end
  def cancel_exchange
    @exchange = Exchange.find(params[:id])
    @offer = @exchange.offer

    # Actualizar el estado de la oferta

    # Eliminar la instancia de Exchange
    @exchange.destroy
    @offer.destroy

    # Redirigir a la página deseada con un mensaje
    redirect_to exchange_lobby_path
  end
end
