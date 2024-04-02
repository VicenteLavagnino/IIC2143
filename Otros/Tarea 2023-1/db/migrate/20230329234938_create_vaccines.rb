class CreateVaccines < ActiveRecord::Migration[7.0]
  def change
    create_table :vaccines do |t|
      t.string :vaccine_type
      t.string :vaccine_date

      t.timestamps
    end
  end
end
