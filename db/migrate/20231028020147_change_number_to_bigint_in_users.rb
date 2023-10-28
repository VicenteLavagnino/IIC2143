class ChangeNumberToBigintInUsers < ActiveRecord::Migration[7.0]
  def change
    change_column :users, :number, :bigint
  end
  
end
