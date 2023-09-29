class CreateAdmins < ActiveRecord::Migration[7.0]
  def change
    create_table :admins do |t|
      t.string :name
      t.text :description
      t.string :image
      t.integer :number
      t.string :mail
      t.string :password

      t.timestamps
    end
  end
end
