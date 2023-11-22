class AddProductNamesToExchangeDone < ActiveRecord::Migration[7.0]
  def change
    add_column :exchange_dones, :seller_product_name, :string
    add_column :exchange_dones, :bidder_product_name, :string
  end
end
