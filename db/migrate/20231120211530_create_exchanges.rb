class CreateExchanges < ActiveRecord::Migration[7.0]
  def change
    create_table :exchanges do |t|
      t.references :seller_product, foreign_key: { to_table: :products }
      t.references :buyer_product, foreign_key: { to_table: :offers }
      t.string :seller_state
      t.string :bidder_state

      t.timestamps
    end
  end
end
