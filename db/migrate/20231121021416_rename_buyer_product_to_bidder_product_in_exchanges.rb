class RenameBuyerProductToBidderProductInExchanges < ActiveRecord::Migration[7.0]
  def change
    rename_column :exchanges, :buyer_product_id, :bidder_product_id
  end
end
