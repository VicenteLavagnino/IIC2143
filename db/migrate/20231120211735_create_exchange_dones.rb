class CreateExchangeDones < ActiveRecord::Migration[7.0]
  def change
    create_table :exchange_dones do |t|
      t.string :seller_name
      t.string :bidder_name
      t.string :seller_product
      t.string :bidder_product

      t.timestamps
    end
  end
end
