class CreateOffers < ActiveRecord::Migration[7.0]
  def change
    create_table :offers do |t|
      t.references :user, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true
      t.string :name
      t.string :set
      t.text :description
      t.string :image
      t.string :state

      t.timestamps
    end
  end
end
