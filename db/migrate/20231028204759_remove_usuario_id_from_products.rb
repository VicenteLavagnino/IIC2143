class RemoveUsuarioIdFromProducts < ActiveRecord::Migration[7.0]
  def change
    remove_column :products, :usuario_id, :integer
  end
end
