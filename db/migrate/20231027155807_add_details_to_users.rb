class AddDetailsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :description, :string
    add_column :users, :phone_number, :string
    add_column :users, :image, :string
  end
end