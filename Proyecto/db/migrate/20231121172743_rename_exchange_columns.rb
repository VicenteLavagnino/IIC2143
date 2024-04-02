class RenameExchangeColumns < ActiveRecord::Migration[6.0]
  def change
    rename_column :exchanges, :seller_product_id, :product_id
    rename_column :exchanges, :bidder_product_id, :offer_id
  end
end
