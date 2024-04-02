class Exchange < ApplicationRecord
  belongs_to :product
  belongs_to :offer
  after_destroy :create_exchange_done_if_product_deleted
  @@exchange_done_created = false

  private

  def create_exchange_done_if_product_deleted
    return if @@exchange_done_created
    if seller_state != 'Confirmado' || bidder_state != 'Confirmado'
      state = 'Fallida'
    else
      state = 'Completada'
    end

    ExchangeDone.create(
      seller_name: product&.user&.name,
      bidder_name: offer&.user&.name,
      seller_id: product&.user&.id,
      bidder_id: offer&.user&.id,
      seller_product_name: product&.name,
      bidder_product_name: offer&.name,
      seller_product: product&.image,
      bidder_product: offer&.image,
      state: state
    )
    @@exchange_done_created = true
  end
end
