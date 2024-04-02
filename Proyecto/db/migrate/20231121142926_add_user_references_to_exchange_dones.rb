class AddUserReferencesToExchangeDones < ActiveRecord::Migration[7.0]
  def change
    add_column :exchange_dones, :seller_id, :integer
    add_column :exchange_dones, :bidder_id, :integer
    add_index :exchange_dones, :seller_id
    add_index :exchange_dones, :bidder_id
  end
end
